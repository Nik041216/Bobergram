import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import '../models/app_settings.dart';

class CustomDrawer extends StatelessWidget {
  final User user;

  const CustomDrawer({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);
    final isDarkMode = settings.isDarkTheme;

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(user.name),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(user.avatar),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Positioned(
                top: 50,
                right: 8,
                child: IconButton(
                  iconSize: 30,
                  onPressed: settings.toggleTheme, 
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                      key: ValueKey<bool>(isDarkMode),
                      color: Colors.white
                    ),
                  ),
                )
              ),
            ],
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Профиль'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () {
              Navigator.pushNamed(
                context, 
                '/settings',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('О приложении'),
          ),
        ],
      ),
    );
  }
}