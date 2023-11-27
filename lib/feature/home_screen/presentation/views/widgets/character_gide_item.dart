import 'package:charachters_info_app/core/utils/constnts/colors.dart';
import 'package:charachters_info_app/feature/home_screen/data/models/character_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constnts/strings.dart';

class CharacterGridItem extends StatelessWidget {
  final Results characters;

  const CharacterGridItem({Key? key, required this.characters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, charDetailsScreen,arguments: characters);
        },
        child: GridTile(
          footer: Hero(
            //اي حاجه تكون uniqe مش شرط الcharacters.id
            tag: characters.id!,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${characters.name}',
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: MyColors.myWhite,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: characters.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/reload.gif',
                    image: characters.image!,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/R.jfif'),
          ),
        ),
      ),
    );
  }
}
