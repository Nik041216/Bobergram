import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';
import '../widgets/preview_chat_box.dart';
import '../widgets/expansion_panel_list.dart';

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
          PreviewChatBox(colorMe: settings.myBubbleColor, colorOther: settings.otherMessageColor),

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
          EditableExpansionPanelList(),
        ],
      ),
    );
  }
}