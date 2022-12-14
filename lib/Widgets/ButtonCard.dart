import 'package:flutter/material.dart';
import 'package:chat_app/Model/ChatModel.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.titleName, required this.icon})
      : super(key: key);

  final String titleName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xff25D366),
            radius: 23,
            child: Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
          ),
          title: Text(
            titleName,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
