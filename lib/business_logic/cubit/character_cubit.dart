import 'package:bloc/bloc.dart';
import 'package:flutter_breakingbad/data/models/characters.dart';
import 'package:flutter_breakingbad/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
 final CharactersRepository charactersRepository;
   List<Character> characters = [];

  CharacterCubit(this.charactersRepository) : super(CharacterInitial());


  List<Character> fetchAllCharacters(){
    charactersRepository.FetchCharacters().then((characters_a)  {
      emit(CharactersLoaded(characters_a));
      this.characters = characters_a;
    });
    print(characters);
    return characters;

  }
}
