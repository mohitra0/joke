// lib/presentation/screens/joke_list_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:joke/data/providers/joke_provider.dart';
import 'package:joke/data/repositories/joke_repository.dart';
import 'package:provider/provider.dart';

class JokeListScreen extends StatefulWidget {
  @override
  State<JokeListScreen> createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  final repository = JokeRepository();
  Timer? _timer; // Timer instance
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _fetchJoke();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchJoke() async {
    final joke = await repository.fetchJoke();
    Provider.of<JokeProvider>(context, listen: false).addJoke(joke);
  }

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);
    final jokes = jokeProvider.jokes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes by Mohit'),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(joke.text),
          );
        },
      ),
    );
  }
}
