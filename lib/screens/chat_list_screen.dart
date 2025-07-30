import 'package:flutter/material.dart';
import '../models/chat.dart';
import '../widgets/chat_card.dart';
import '../widgets/custom_drawer.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';

class ChatListScreen extends StatelessWidget {

  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);
    final isDarkMode = settings.isDarkTheme;
    final logo = isDarkMode
      ? 'assets/photo/logo_white.png'
      : 'assets/photo/logo.png';
    final List<Chat> chats = [
      Chat(
        id: '1',
        name: 'Иван Петров',
        avatar: 'assets/avatars/user1.png',
        lastMessage: 'Привет! Как дела?',
        time: '12:34',
      ),
      Chat(
        id: '2',
        name: 'Анна Смирнова',
        avatar: 'assets/avatars/user2.png',
        lastMessage: 'Окей, жду тебя :)',
        time: '11:47',
      ),
      // можно добавить больше заглушек
    ];

    final currentUser = User(
      id:'u1',
      name: 'Бобр Никита',
      avatar: 'assets/photo/logo.png'
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              logo,
              width: 32,
              height: 32,
              ),
            Text('Bobergram'),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: 'Открыть меню',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(user: currentUser),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatCard(
            chat: chat,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/chat',
                arguments: chat,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: 
              (BuildContext context) => AlertDialog(
                title: const Text('Заглушка'),
                content: const Text('Это временная заглушка, будет использовано для перехода для создания чата с контактами'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text('Отмена')
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Окей'),
                    child: Text('Окей')
                  ),
                ],
              )
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(Icons.edit),
        ),
    );
  }
}