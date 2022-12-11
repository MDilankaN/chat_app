import 'package:chat_app/Widgets/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: 'Menaka',
        icon: "person.svg",
        currentMsg: "hey",
        time: '4:00',
        isGroup: false),
    ChatModel(
        name: 'Trip Gang',
        icon: "groups.svg",
        currentMsg: "Let's Go",
        time: '16:10',
        isGroup: true),
    ChatModel(
        name: 'Ravindu',
        icon: "person.svg",
        currentMsg: "Dude..!!",
        time: '10:00',
        isGroup: false),
    ChatModel(
        name: 'Malith',
        icon: "person.svg",
        currentMsg: "Ha ha",
        time: '00:00',
        isGroup: false),
    ChatModel(
        name: 'Chamidu',
        icon: "person.svg",
        currentMsg: "What...??",
        time: '14:21',
        isGroup: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(chatModel: chats[index])),
    );
  }
}
