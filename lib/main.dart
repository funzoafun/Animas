import 'package:animas/provider/AnimeProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './utils/theme_notifier.dart';
import './values/theme.dart';
import './screens/login_landing_page.dart';
import './screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          child: MyApp(),
        ),
      );
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => AnimeProviders())],
      child: MaterialApp(
        title: "Animas",
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.getTheme(),
        // theme: ThemeData(
        //   // primary color for the app
        //   primaryColor: Colors.blue,

        //   // text theme
        //   textTheme: const TextTheme(
        //     displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //     titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //     titleMedium: TextStyle(fontFamily: "JosefinSans", fontSize: 30),
        //     bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        //   ),
        // ),
        // routes
        routes: {
          LoginLandingPage.routeName: (context) => LoginLandingPage(),
          Home.routeName: (context) => Home(),
        },
      ),
    );
  }
}
