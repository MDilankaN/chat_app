import 'package:emoji_picker_2/emoji_lists.dart';

class ChatModel {
  late String name;
  late String icon;
  late bool isGroup;
  late String time;
  late String currentMsg;
  late String status;
  late bool select = false;

  ChatModel(
      {this.name = "",
      this.icon = "",
      this.currentMsg = "",
      this.time = "",
      this.isGroup = false,
      select = false,
      this.status = ""});
}
