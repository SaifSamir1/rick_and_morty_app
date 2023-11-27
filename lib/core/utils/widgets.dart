


import 'package:flutter/material.dart';

import 'constnts/colors.dart';

Widget buildNoInternetWidget() {
  return Center(
    child: Container(
      width: double.infinity,
      color: const Color(0xffC3EEFF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Can\'t connect .. check internet',
            style: TextStyle(
              fontSize: 22,
              color: MyColors.myGrey,
            ),
          ),
          Image.asset('assets/images/on_internet.jpg')
        ],
      ),
    ),
  );
}


SizedBox buildNoResultFound() {
  return const SizedBox(
    width: double.infinity,
    height: 300,
    child: Center(
      child: Text('No Result Found . . . . .',style: TextStyle(
        fontSize: 20,
        color: MyColors.myYellow,
        fontWeight: FontWeight.w500,
      ),),
    ),
  );
}
