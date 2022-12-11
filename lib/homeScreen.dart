import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton<String>(
                onSelected: ((value) => {print(value)}),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(child: Text("New group"), value: "New group"),
                    PopupMenuItem(
                        child: Text("New broadcast"), value: "New broadcast"),
                    PopupMenuItem(
                        child: Text("Whatsapp Web"), value: "Whatsapp Web"),
                    PopupMenuItem(
                        child: Text("Starred Message"),
                        value: "Starred Message"),
                    PopupMenuItem(child: Text("Settings"), value: "Settings"),
                  ];
                })
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Text("camera"),
            Text("chats"),
            Text("status"),
            Text("callse"),
          ],
        ));
  }
}
