import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/info.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);
  static const route = '/chat-list-screen';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          return UserMessageBubble(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
        }
        return SenderMessageBubble(
          message: messages[index]['text'].toString(),
          date: messages[index]['time'].toString(),
        );
      },
    );
  }
}
