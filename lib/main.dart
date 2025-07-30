import 'package:flutter/material.dart';
import 'package:messanger/screens/customize_color_chat.dart';
import 'screens/chat_list_screen.dart';
import 'screens/chat_screen.dart';
import 'models/chat.dart';
import 'screens/settings_sreen.dart';
import 'theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'models/app_settings.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, _) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(settings.interfaceScale),
          ),
          child: MaterialApp(
            title: 'Мессенджер',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: settings.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (context) => const ChatListScreen(),
              '/chat': (context) {
                final chat =
                    ModalRoute.of(context)!.settings.arguments as Chat;
                return ChatScreen(chat: chat);
              },
              '/settings': (context) => SettingsSreen(),
              '/pickColorBuble': (context) => CustomizeColorChat(),
            },
          ),
        );
      },
    );
  }
}

