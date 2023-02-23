import 'package:animas/provider/AnimeProviders.dart';
import 'package:animas/screens/ScanlationsAnimes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './utils/theme_notifier.dart';
import './screens/login_landing_page.dart';
import './screens/home.dart';
import './provider/Animes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AnimeProviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Animes(),
        ),
      ],
      child: MaterialApp(
        title: "Animas",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primary color for the app
          primaryColor: Color.fromARGB(255, 22, 206, 31),

          // text theme
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            titleMedium: TextStyle(
                fontFamily: "JosefinSans",
                fontSize: 20,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        // routes
        routes: {
          LoginLandingPage.routeName: (context) => LoginLandingPage(),
          Home.routeName: (context) => Home(),
          ScanlationsAnimes.routeName: (context) => ScanlationsAnimes(),
        },
      ),
    );
  }
}
