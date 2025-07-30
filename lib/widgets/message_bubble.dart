import 'package:flutter/material.dart';
import '../models/app_settings.dart';
import 'package:provider/provider.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);
    final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final isDarkMode = settings.isDarkTheme;
    var bgColor = isMe ? settings.myBubbleColor : settings.otherMessageColor;
    if(isDarkMode){
      bgColor = isMe ? settings.myBubbleColorDark : settings.otherMessageColorDark;
    }
    else{
      bgColor = isMe ? settings.myBubbleColor : settings.otherMessageColor;
    }

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16 * settings.messageTextSize,
            ),
          ),
        ),
      ],
    );
  }
}
