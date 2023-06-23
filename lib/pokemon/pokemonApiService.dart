import 'package:http/http.dart' as http;
import 'dart:convert';

import 'pokemon.dart';

class PokemonApiService {
  Future<List<dynamic>> fetchPokemons() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      print(results);
      List<Pokemon> pokemons = results.map((json) => Pokemon.fromJson(json)).toList();
      print(pokemons);
      return results;
    } else {
      throw Exception('Failed to fetch pokemons');
    }
  }
}
