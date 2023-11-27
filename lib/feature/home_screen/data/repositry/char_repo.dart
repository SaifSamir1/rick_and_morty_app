






import 'package:charachters_info_app/feature/home_screen/data/models/character_model.dart';

import '../../../../core/wep_servise/api_servises.dart';

class CharactersRepository {
  final CharacterServices characterServices;

  CharactersRepository(this.characterServices);

  Future<List<Results>> getAllCharacters() async {

    final characters = await characterServices.getAllCharacters();

    List<Results> allCharacter =[];
    for(var item in characters['results']){
      allCharacter.add(Results.fromJson(item));
    }
    return allCharacter;
  }




}