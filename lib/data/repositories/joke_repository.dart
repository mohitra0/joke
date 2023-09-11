// lib/data/repositories/joke_repository.dart
import 'dart:async'; // Add this import for asynchronous operations
import 'package:joke/data/api/joke_api.dart';
import 'package:joke/data/models/joke_model.dart';

class JokeRepository {
  final JokeApi _api = JokeApi();

  Future<Joke> fetchJoke() async {
    final jokeText = await _api.fetchJoke();
    return Joke(jokeText);
  }
}
