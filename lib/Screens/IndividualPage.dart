import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Widgets/OwnMessage.dart';
import 'package:chat_app/Widgets/ReplyMessage.dart';
import 'package:chat_app/keys.dart';
import 'package:emoji_picker_2/emoji_picker_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {Key? key, required this.chatModel, required this.sourceChat})
      : super(key: key);

  final ChatModel chatModel;
  final ChatModel sourceChat;
  @override
  State<IndividualPage> createState() => _IndividualPage();
}

class _IndividualPage extends State<IndividualPage> {
  bool showEmojiPicker = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  IO.Socket socket = IO.io(SERVER_URL, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });
  bool sendBtn = false;

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmojiPicker = false;
        });
      }
    });
  }

  void connect() {
    socket.connect();
    socket.onConnect((data) => print('connected'));
    socket.emit('signin', widget.sourceChat.id); // /test is the event
  }

  void sendMessage(String message, int sourceID, int targetID) {
    print('message');
    socket.emit("message", {message, sourceID, targetID});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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
                      PopupMenuItem(
                          child: Text("Wallpaper"), value: "Wallpaper"),
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
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 120,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessage(),
                        OwnMessage(),
                        ReplyMessage(),
                        ReplyMessage(),
                        OwnMessage(),
                        OwnMessage(),
                        ReplyMessage(),
                        ReplyMessage(),
                        OwnMessage(),
                        OwnMessage(),
                        OwnMessage(),
                        ReplyMessage(),
                        ReplyMessage(),
                        OwnMessage(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                    margin: EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendBtn = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendBtn = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type a message",
                                          prefixIcon: IconButton(
                                            icon: Icon(
                                              Icons.emoji_emotions,
                                              color: Color(0xFF128C7E),
                                            ),
                                            onPressed: () {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              setState(() {
                                                showEmojiPicker =
                                                    !showEmojiPicker;
                                              });
                                            },
                                          ),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.attach_file,
                                                  color: Color(0xFF128C7E),
                                                ),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          bottomSheetFileAttach());
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.camera_alt,
                                                  color: Color(0xFF128C7E),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.all(5)),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, right: 5, left: 2),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(
                                    sendBtn ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (sendBtn) {
                                      sendMessage(
                                          _controller.text,
                                          widget.sourceChat.id,
                                          widget.chatModel.id);
                                      _controller.clear();
                                      setState(() {
                                        sendBtn = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        showEmojiPicker ? emojiSelect() : Container(),
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (showEmojiPicker) {
                  setState(() {
                    showEmojiPicker = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker2(
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      },
    );
  }

  Widget bottomSheetFileAttach() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headphones, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.green, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {
        print(text);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
