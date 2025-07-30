import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';
import 'message_bubble.dart';

class PreviewChatBox extends StatelessWidget {
  const PreviewChatBox({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);

    final List<Map<String, dynamic>> _messages = [
      {'text': 'Привет!', 'isMe': false},
      {'text': 'Привет, как дела?', 'isMe': true},
      {'text': 'Всё отлично, ты как?', 'isMe': false},
    ];

    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: settings.chatBackgroundImage != null
          ? DecorationImage(
              image: AssetImage(settings.chatBackgroundImage!),
              fit: BoxFit.cover,
            )
          : null,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return MessageBubble(
                  text: message['text'],
                  isMe: message['isMe'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}