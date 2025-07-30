import 'package:flutter/material.dart';
import '../models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatCard({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(chat.avatar),
        ),
        title: Text(chat.name),
        subtitle: Text(
          chat.lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(chat.time),
      ),
      const Divider(height: 1, thickness: 1, indent: 72,)
      ]
    );
  }
}