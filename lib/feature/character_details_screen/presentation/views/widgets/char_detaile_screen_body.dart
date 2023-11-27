import 'package:charachters_info_app/core/utils/constnts/colors.dart';
import 'package:flutter/material.dart';

import '../../../../home_screen/data/models/character_model.dart';

class CharDetailsScreenBody extends StatelessWidget {
  final Results character;

  const CharDetailsScreenBody({super.key, required this.character});

  Widget buildAppBarSliver() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name!,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.white,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildAppBarSliver(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              buildCharDetailsList(),
              const SizedBox(
                height: 600,
              )
            ],
          ),
        ),
      ],
    );
  }

  Container buildCharDetailsList() {
    return Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('species : ', character.species!),
                  buildDivider(285),
                  characterInfo('gender : ', character.gender!),
                  buildDivider(295),
                  character.type!.isNotEmpty
                      ? characterInfo('type : ', character.type!)
                      : Container(),
                  character.type!.isNotEmpty
                      ? buildDivider(310)
                      : Container(),
                  characterInfo('Status : ', character.status!),
                  buildDivider(300),
                ],
              ),
            );
  }
}
