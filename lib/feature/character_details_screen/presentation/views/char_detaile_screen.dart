import 'package:charachters_info_app/feature/character_details_screen/presentation/views/widgets/char_detaile_screen_body.dart';
import 'package:charachters_info_app/feature/home_screen/data/models/character_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constnts/colors.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key,required this.character}) : super(key: key);


  final Results character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SafeArea(
        child: CharDetailsScreenBody(character: character,),
      ),
    );
  }
}

