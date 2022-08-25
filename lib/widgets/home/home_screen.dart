import 'package:cryptic/widgets/login/login_page.dart';
import 'package:cryptic/widgets/register/register_page.dart';
import 'package:cryptic/widgets/settings/settings_page.dart';
import 'package:flutter/material.dart';

import '../../common/constants/constants_strings.dart' as constants;

class HomeScreen extends StatefulWidget {
  static const routeName = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _handleClicks(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text(constants.AppSettingStrings.themes),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _handleClicks(CrypticPreferences.routeName);
              },
            ),
            ListTile(
              title: const Text(constants.AppSettingStrings.login),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _handleClicks(LoginScreen.routeName);
              },
            ),
            ListTile(
              title: const Text(constants.AppSettingStrings.reigster),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _handleClicks(RegisterPage.routeName);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 0,
      ),
    );
  }
}
