import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';

class CustomizeColorChat extends StatelessWidget {
  CustomizeColorChat({super.key});

  @override
  Widget build(BuildContext context) {
    final isMe = ModalRoute.of(context)!.settings.arguments as bool;

    return DefaultTabController(
      initialIndex: 1,
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
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text("It's cloudy here")),
            Center(child: Text("It's sunny here")),
          ],
        ),
      ),
    );
  }
}