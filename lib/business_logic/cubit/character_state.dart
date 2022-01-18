part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}
class CharactersLoaded extends CharacterState {

  final List<Character> characters_a;

  CharactersLoaded(this.characters_a);

}