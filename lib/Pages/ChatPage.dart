import 'package:chat_app/Screens/SelectContact.dart';
import 'package:chat_app/Widgets/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chats, required this.sourceChat})
      : super(key: key);
  final List<ChatModel> chats;
  final ChatModel sourceChat;

  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContatct()))
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: widget.chats.length,
          itemBuilder: (context, index) => CustomCard(
              chatModel: widget.chats[index], sourceChat: widget.sourceChat)),
    );
  }
}
