import 'package:chat_app/Widgets/ContactCard.dart';
import 'package:flutter/material.dart';

class SelectContatct extends StatefulWidget {
  @override
  _SelectContatctState createState() => _SelectContatctState();
}

class _SelectContatctState extends State<SelectContatct> {
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
                      child: Text("Invite a friend"), value: "Invite a friend"),
                  PopupMenuItem(child: Text("Contacts"), value: "Contacts"),
                  PopupMenuItem(child: Text("Refresh"), value: "Refresh"),
                  PopupMenuItem(child: Text("Help"), value: "Help"),
                ];
              })
        ],
      ),
      body: ListView(
        children: [ContactCard()],
      ),
    );
  }
}
