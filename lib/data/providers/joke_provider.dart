import 'package:flutter/foundation.dart';
import 'package:joke/data/models/joke_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JokeProvider extends ChangeNotifier {
  List<Joke> _jokes = [];

  List<Joke> get jokes => _jokes;

  // Initialize with jokes from SharedPreferences
  JokeProvider() {
    print('checkwehncalled');
    _loadJokes();
  }

  void addJoke(Joke joke) {
    _jokes.add(joke);
    if (_jokes.length > 10) {
      _jokes
          .removeAt(0); // Remove the oldest joke if the list exceeds 10 jokes.
    }
    _saveJokes(); // Save jokes to SharedPreferences
    notifyListeners();
  }

  Future<void> _loadJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final jokeTexts = prefs.getStringList('jokes') ?? [];
    _jokes = jokeTexts.map((jokeText) => Joke(jokeText)).toList();
    notifyListeners();
  }

  void _saveJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final jokeTexts = _jokes.map((joke) => joke.text).toList();
    prefs.setStringList('jokes', jokeTexts);
  }
}
