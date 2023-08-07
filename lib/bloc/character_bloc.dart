import 'package:anywhere_code_exercise/models/viewer_model.dart';
import 'package:anywhere_code_exercise/repos/repositories.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _characterRepository;
  CharacterBloc(this._characterRepository) : super(CharacterLoadingState()) {
    on<CharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());

      try {
        final characters = await _characterRepository.getCharacters();
        emit(CharacterLoadedState(characters));
      } catch (e) {
        emit(CharacterErrorState(e.toString()));
      }
    });
  }
}
