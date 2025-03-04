import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectodColor: 5).theme(),
      home: ChatScreen(), 
      // Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: FilledButton.tonal(
      //       onPressed: () {},
      //       child: Text('Hello World'),
      //     ),
      //   ),
      // ),
    );
  }
}