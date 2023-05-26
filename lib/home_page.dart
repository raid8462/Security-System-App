import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:security_system/Components/custom_button.dart';
import 'package:security_system/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGGED IN',
              style: TextStyle(
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: const TextStyle(
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              buttonName: 'Sign Out',
            ),
          ],
        ),
      ),
    );
  }
}
