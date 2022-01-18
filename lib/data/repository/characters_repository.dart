import 'package:flutter_breakingbad/data/models/characters.dart';
import 'package:flutter_breakingbad/data/restApi/characters_api.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);

  Future<List<Character>> FetchCharacters() async {
    final characters = await charactersApi.getAllCharacters();
     //print(characters.toString());
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
