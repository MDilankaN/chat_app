import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Widgets/ButtonCard.dart';
import 'package:chat_app/Widgets/ContactCard.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  List<ChatModel> contacts = [
    ChatModel(name: "Menaka", status: "I'm Batman"),
    ChatModel(name: "Chamidu", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Ravindu", status: "Busy"),
    ChatModel(name: "Taneesha", status: "Battery about to die"),
    ChatModel(name: "Salitha", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Dasmitha", status: "I'm a Developer"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075e54),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select contact",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  '256contacts',
                  style: TextStyle(fontSize: 13),
                )
              ]),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton<String>(
                onSelected: ((value) => {print(value)}),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: Text("Invite a friend"),
                        value: "Invite a friend"),
                    PopupMenuItem(child: Text("Contacts"), value: "Contacts"),
                    PopupMenuItem(child: Text("Refresh"), value: "Refresh"),
                    PopupMenuItem(child: Text("Help"), value: "Help"),
                  ];
                })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return ContactCard(contact: contacts[index]);
            }));
  }
}
