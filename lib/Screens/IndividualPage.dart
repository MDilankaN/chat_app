import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPage();
}

class _IndividualPage extends State<IndividualPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor: Color(0xff075e54),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.icon,
                  color: Colors.white,
                  height: 32,
                  width: 32,
                ),
              )
            ],
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatModel.name,
              style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
            ),
            Text(
              "Last seen today at 12:12",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
              onSelected: ((value) => {print(value)}),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      child: Text("View contact"), value: "View contact"),
                  PopupMenuItem(
                      child: Text("Media, links, and docs"),
                      value: "Media, links, and docs"),
                  PopupMenuItem(child: Text("Search"), value: "Search"),
                  PopupMenuItem(
                      child: Text("Mute Notifications"),
                      value: "Mute Notifications"),
                  PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper"),
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Text("More"),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.blueGrey,
                          )
                        ],
                      ),
                      value: "More"),
                ];
              })
        ],
      ),
    );
  }
}
