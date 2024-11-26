import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movoapp/firebase_options.dart';
import 'package:movoapp/pages/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFF141516),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
