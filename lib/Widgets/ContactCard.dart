import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[200],
          radius: 23,
          child: SvgPicture.asset(
            'person.svg',
            color: Colors.white,
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          'Menaka',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "I'm Batman",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
