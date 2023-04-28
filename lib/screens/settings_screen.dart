import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/share_preferences/preferences.dart';
import 'package:user_preferences/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkMode,
                    title: const Text('DarkMode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Male'),
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Female'),
                  value: 2,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Name', helperText: 'User Name'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
