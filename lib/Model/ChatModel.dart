class ChatModel {
  late String name;
  late String icon;
  late bool isGroup;
  late String time;
  late String currentMsg;

  ChatModel(
      {required this.name,
      required this.icon,
      required this.currentMsg,
      required this.time,
      required this.isGroup});
}
