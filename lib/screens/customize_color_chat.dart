import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';
import '../widgets/color_picker.dart';

class CustomizeColorChat extends StatelessWidget {
  CustomizeColorChat({super.key});

  @override
  Widget build(BuildContext context) {
    final isMe = ModalRoute.of(context)!.settings.arguments as bool;
    final settings = Provider.of<AppSettings>(context);
    final isDarkMode = settings.isDarkTheme;
    Color color, colorLite;
    if (isMe) {
      color = settings.myBubbleColorDark;
      colorLite = settings.myBubbleColor;
    } else {
      color = settings.otherMessageColorDark;
      colorLite = settings.otherMessageColor;
    }

    return DefaultTabController(
      initialIndex: isDarkMode ? 1 : 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: isMe ? Text('Цвет моих сообщений') : Text('Цвет сообщений \nсобеседника'),
          bottom: const TabBar(
            automaticIndicatorColorAdjustment: false,
            tabs: <Widget>[
              Tab(text: 'Светлая тема', icon: Icon(Icons.light_mode),),
              Tab(text: 'Темная тема', icon: Icon(Icons.dark_mode),),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Column(children: [
              ColorPickerTile(startColor: colorLite, onColorChanged: (color) {})
            ]),
            Column(children: [
              ColorPickerTile(startColor: color, onColorChanged: (color) {})
            ]),
          ],
        ),
      ),
    );
  }
}