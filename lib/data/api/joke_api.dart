import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeApi {
  Future<String> fetchJoke() async {
    final response = await http.get(
        Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body); // Parse JSON
      final String jokeText = data['joke'];
      return jokeText;
    } else {
      throw Exception('Failed to fetch joke');
    }
  }
}
