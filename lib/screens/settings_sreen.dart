import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';
import '../widgets/preview_chat_box.dart';

class SettingsSreen extends StatelessWidget {
  SettingsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Темная тема'),
            value: settings.isDarkTheme,
            onChanged: (_) => settings.toggleTheme(),
            secondary: Icon(settings.isDarkTheme ? Icons.dark_mode : Icons.light_mode),
          ),
          const Divider(),
          Text('Масштаб интерфейса ${(settings.interfaceScale * 100).toInt()}%', style: Theme.of(context).textTheme.titleMedium),
          Slider(
            value: settings.interfaceScale,
            min: 0.8,
            max: 1.5,
            divisions: 7,
            label: '${(settings.interfaceScale*100).toInt()}%',
            onChanged: settings.setInterfaceScale,
          ),

          const Divider(),
          Text(
            'Размер текста сообщений: ${(settings.messageTextSize*100).toInt()}%',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          Slider(
            value: settings.messageTextSize,
            min: 0.8,
            max: 1.5,
            divisions: 7,
            label: '${(settings.messageTextSize*100).toInt()}%',
            onChanged: settings.setMessageTextSize,
          ),

          const Text('Предпросмотр настроек чата'),
          const PreviewChatBox(),

          ListTile(
            title: const Text('Фон чата'),
            trailing: settings.chatBackgroundImage == null
                ? const Icon(Icons.image_not_supported)
                : Image.asset(
                    settings.chatBackgroundImage!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
            onTap: () async {
              
            },
          ),

          ListTile(
            title: const Text('Цвет ваших сообщений'),
            trailing: SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: settings.myBubbleColor,
                    radius: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: settings.myBubbleColorDark,
                    radius: 15,
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pushNamed(
                context, 
                '/pickColorBuble',
                arguments: true,
              );
            },
          ),

          ListTile(
            title: Text('Цвет сообщений собеседника'),
            trailing: SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: settings.otherMessageColor,
                    radius: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: settings.otherMessageColorDark,
                    radius: 15,
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pushNamed(
                context, 
                '/pickColorBuble',
                arguments: false,
              );
            },
          ),
        ],
      ),
    );
  }
}