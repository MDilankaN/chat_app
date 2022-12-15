import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Widgets/ButtonCard.dart';
import 'package:chat_app/Widgets/ContactCard.dart';
import 'package:chat_app/Widgets/CustomAvatarCard.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Menaka", status: "I'm Batman"),
    ChatModel(name: "Chamidu", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Ravindu", status: "Busy"),
    ChatModel(name: "Taneesha", status: "Battery about to die"),
    ChatModel(name: "Salitha", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Dasmitha", status: "I'm a Developer"),
    ChatModel(name: "Menaka", status: "I'm Batman"),
    ChatModel(name: "Chamidu", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Ravindu", status: "Busy"),
    ChatModel(name: "Taneesha", status: "Battery about to die"),
    ChatModel(name: "Salitha", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Dasmitha", status: "I'm a Developer"),
    ChatModel(name: "Menaka", status: "I'm Batman"),
    ChatModel(name: "Chamidu", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Ravindu", status: "Busy"),
    ChatModel(name: "Taneesha", status: "Battery about to die"),
    ChatModel(name: "Salitha", status: "Hey there I'm using Whatsapp..!"),
    ChatModel(name: "Dasmitha", status: "I'm a Developer"),
  ];

  List<ChatModel> groups = [];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075e54),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Group",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Add participants',
                  style: TextStyle(fontSize: 13),
                )
              ]),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (contacts[index].select == false) {
                          setState(() {
                            contacts[index].select = true;
                            groups.add(contacts[index]);
                          });
                        } else {
                          setState(() {
                            contacts[index].select = false;
                            groups.remove(contacts[index]);
                          });
                        }
                      },
                      child: ContactCard(contact: contacts[index]));
                }),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      contacts[index].select = false;
                                      groups.remove(contacts[index]);
                                    });
                                  },
                                  child: CustomAvatarCard(
                                      contact: contacts[index]));
                            } else {
                              return Container();
                            }
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
