import 'package:flutter/material.dart';
import 'package:user_preferences/share_preferences/preferences.dart';
import 'package:user_preferences/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode: ${Preferences.isDarkMode}'),
            Divider(),
            Text('Gender: ${Preferences.gender}'),
            Divider(),
            Text('User Name: ${Preferences.name}'),
            Divider()
          ],
        ));
  }
}
