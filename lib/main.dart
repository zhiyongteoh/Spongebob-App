// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spongebob/services/character_service.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharacterService(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spongebob Characters',
        home: IntroPage(),
      ),
    );
  }
}