import 'package:google_docs_clone_flutter/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketClient {
  io.Socket? socket;
  static SocketClient? _instance;

  // socket constructor as you can create only one instance of this 
  SocketClient._internal() {
    socket = io.io(host , <String , dynamic>{
      'transports' : ['websocket'],
      'autoConnect' : false,
    });
    socket!.connect();
  }
  
  static SocketClient get instance {
    _instance ??=SocketClient._internal();
    return _instance!;
  }
}