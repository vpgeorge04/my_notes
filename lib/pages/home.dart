import 'package:flutter/material.dart';
import 'package:my_notes/pages/dashboard.dart';
import 'package:my_notes/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.hasData) {
              // If the user is authenticated, show the Dashboard
              return const DashboardPage();
            } else {
              // If the user is not authenticated, show the LoginPage
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}
