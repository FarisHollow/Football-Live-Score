import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  runApp(const FootballLiveApp());
}

class FootballLiveApp extends StatelessWidget {
  const FootballLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
