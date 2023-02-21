import 'package:animas/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import '../utils/authentication.dart';

class LoginLandingPage extends StatelessWidget {
  const LoginLandingPage({super.key});
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.jpg"),
                  maxRadius: 50,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  "ANIMAS",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
