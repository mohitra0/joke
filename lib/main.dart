// lib/presentation/app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:joke/data/providers/joke_provider.dart';
import 'package:joke/presentation/screens/joke_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JokeProvider(),
      child: MaterialApp(
        title: 'Mohit Jokes',
        home: JokeListScreen(),
      ),
    );
  }
}
