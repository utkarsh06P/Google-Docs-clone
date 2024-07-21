import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone_flutter/repository/auth_repository.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle(WidgetRef ref , BuildContext context) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final errorModel = await ref.read(authRepositoryProvider).signInWithGoogle();
    // ignore: use_build_context_synchronously
    final navigator = Routemaster.of(context);
    if(errorModel.error!=null) {
      sMessenger.showSnackBar(
        SnackBar(content: Text(errorModel.error!)),
      );
    } else {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator.replace('/');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref)  {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signInWithGoogle(ref , context),
          icon: Image.asset('assets/g-logo-2.png',
          height: 20,
          ),
          label: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
