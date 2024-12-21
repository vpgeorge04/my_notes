import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

Future<void> login(String email, String password) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    throw Exception('Login failed: $e');
  }
}

Future<void> logout() async {
  await FirebaseAuth.instance.signOut(); // This signs out the user
}

void register(String email, String password) async{
  await auth.createUserWithEmailAndPassword(email: email, password: password);
}