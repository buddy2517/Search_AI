import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  WebSocket? _socket;

  factory ChatWebService() => _instance;

  ChatWebService._internal();
  final _searchResultController = StreamController<Map<String,dynamic>>();
  final _contentController = StreamController<Map<String,dynamic>>();

  Stream<Map<String,dynamic>> get searchResultStream => _searchResultController.stream;
  Stream<Map<String,dynamic>> get contentStream => _contentController.stream;

  void connect(){
    final websocketUrl = dotenv.env['CHAT_WEBSOCKET_URL'];
    if (websocketUrl == null) {
      throw Exception('CHAT_WEBSOCKET_URL not found in .env file');
    }

    _socket = WebSocket(Uri.parse(websocketUrl));

    _socket!.messages.listen((message){
      final data = json.decode(message);
      if(data["type"] == "search_result"){
        _searchResultController.add(data);
      }else if(data["type"] == "content"){
        _contentController.add(data);
      }
    });
  }

  void chat(String query){
    print(_socket);
    _socket!.send(json.encode({"query" : query}));
  }
}