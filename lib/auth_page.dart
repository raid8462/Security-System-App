import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:security_system/verify_email_page.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if user is logged in they are navigated to the home page
            if (snapshot.hasData) {
              return const VerifyEmailPage();
            }
            // if user is not logged then navigated to login page
            return const LoginOrRegisterPage();
          }),
    );
  }
}
