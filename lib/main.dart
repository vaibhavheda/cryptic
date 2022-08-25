import 'package:cryptic/firebase_options.dart';
import 'package:cryptic/widgets/home/home_screen.dart';
import 'package:cryptic/widgets/register/register_page.dart';
import 'package:cryptic/widgets/settings/settings_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptic/utils/themes/theme_manager.dart';
import 'package:cryptic/widgets/login/login_page.dart';

void main() async {
  /*
    Initialize Firebase
   */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /*
    Route name for Home Screen
  */
  const homeRoute = HomeScreen.routeName;
  // do computation of initial route here and pass it to my app.
  const CrypticApp crypticApp = CrypticApp(
    homeRoute: homeRoute,
  );
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: crypticApp,
  ));
}

class CrypticApp extends StatefulWidget {
  final String homeRoute;
  const CrypticApp({Key? key, required this.homeRoute}) : super(key: key);

  @override
  State<CrypticApp> createState() => _CrypticAppState();
}

class _CrypticAppState extends State<CrypticApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        title: 'Cryptic App',
        theme: theme.getTheme,
        initialRoute: HomeScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          CrypticPreferences.routeName: (context) => const CrypticPreferences(),
        },
      ),
    );
  }
}
