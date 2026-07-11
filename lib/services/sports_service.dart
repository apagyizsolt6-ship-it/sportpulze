import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/league_model.dart';

class SportsService {
  final String apiKey = "123"; // A tesztkulcs

  Future<List<League>> fetchAllLeagues() async {
    final response = await http.get(Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/$apiKey/all_leagues.php'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['leagues'];
      return data.map((json) => League.fromJson(json)).toList();
    } else {
      throw Exception('Nem sikerült betölteni a ligákat');
    }
  }
}
