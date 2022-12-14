import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/CreateGroup.dart';
import 'package:chat_app/Widgets/ButtonCard.dart';
import 'package:chat_app/Widgets/ContactCard.dart';
import 'package:flutter/material.dart';

class SelectContatct extends StatefulWidget {
  @override
  _SelectContatctState createState() => _SelectContatctState();
}

class _SelectContatctState extends State<SelectContatct> {
  List<ChatModel> contacts = [
    ChatModel(name: "Menaka", status: "I'm Batman"),
    ChatModel(name: "Chamidu", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Ravindu", status: "Busy"),
    ChatModel(name: "Taneesha", status: "Battery about to die"),
    ChatModel(name: "Salitha", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Dasmitha", status: "I'm a Developer"),
  ];

  @override
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
                  '256 contacts',
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
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    titleName: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  titleName: "New contact",
                );
              }
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
