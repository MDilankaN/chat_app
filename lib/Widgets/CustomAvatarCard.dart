import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAvatarCard extends StatelessWidget {
  const CustomAvatarCard({Key? key, required this.contact}) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey[200],
                radius: 23,
                child: SvgPicture.asset(
                  'person.svg',
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 18,
                    )),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
