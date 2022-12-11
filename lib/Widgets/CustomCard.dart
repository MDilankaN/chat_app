import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  // const CustomCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text(
        '+94771608082',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text(
            'Hey',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
      trailing: Text("18:00"),
    );
  }
}