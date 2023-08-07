part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  CharacterLoadedState(this.characters);

  final ViewerModel characters;
  List<Object?> get props => [characters];
}

class CharacterErrorState extends CharacterState {
  CharacterErrorState(this.error);

  final String error;
  List<Object?> get props => [error];
}
