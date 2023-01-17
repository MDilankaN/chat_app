import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/homeScreen.dart';
import 'package:chat_app/Widgets/ButtonCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel sourceModel = ChatModel();
  List<ChatModel> chats = [
    ChatModel(
        name: 'Menaka',
        icon: "person.svg",
        currentMsg: "hey",
        time: '4:00',
        isGroup: false,
        id: 1),
    ChatModel(
      name: 'Trip Gang',
      icon: "groups.svg",
      currentMsg: "Let's Go",
      time: '16:10',
      isGroup: true,
      id: 2,
    ),
    ChatModel(
        name: 'Ravindu',
        icon: "person.svg",
        currentMsg: "Dude..!!",
        time: '10:00',
        isGroup: false,
        id: 3),
    ChatModel(
        name: 'Malith',
        icon: "person.svg",
        currentMsg: "Ha ha",
        time: '00:00',
        isGroup: false,
        id: 4),
    ChatModel(
        name: 'Chamidu',
        icon: "person.svg",
        currentMsg: "What...??",
        time: '14:21',
        isGroup: false,
        id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: ((context, index) => InkWell(
              onTap: (() {
                sourceModel = chats.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => MyHomePage(
                              title: "Chat App Clone",
                              chats: chats,
                              sourceChat: sourceModel,
                            )));
              }),
              child: ButtonCard(
                  titleName: chats[index].name, icon: Icons.person)))),
    );
  }
}
