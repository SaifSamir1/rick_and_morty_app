import 'package:bloc/bloc.dart';
import 'package:charachters_info_app/feature/home_screen/data/repositry/char_repo.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/character_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.charactersRepository) : super(HomeInitial());


  final CharactersRepository charactersRepository;

  List<Results> characters= [];

  List<Results> getAllCharacters()
  {
     charactersRepository.getAllCharacters().then((value) {
      characters = value;
      emit(GetAllCharactersSuccessState(characters));
    }).catchError((error){
      if (kDebugMode) {
        print( error.toString());
      }
      emit(GetAllCharactersErrorState());
    });

    return characters;
  }
}
