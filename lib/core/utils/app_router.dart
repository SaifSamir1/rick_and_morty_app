import 'package:charachters_info_app/core/utils/constnts/strings.dart';
import 'package:charachters_info_app/core/wep_servise/api_servises.dart';
import 'package:charachters_info_app/feature/character_details_screen/presentation/views/char_detaile_screen.dart';
import 'package:charachters_info_app/feature/splash_screen/presentation/views/splash_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home_screen/data/models/character_model.dart';
import '../../feature/home_screen/data/repositry/char_repo.dart';
import '../../feature/home_screen/presentation/manger/cubit/home_cubit.dart';
import '../../feature/home_screen/presentation/views/home_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late HomeCubit homeCubit;

  AppRouter() {
    //خلي بالك انا كدا عملت create object from CharacterServices class
    charactersRepository = CharactersRepository(CharacterServices());
    homeCubit = HomeCubit(charactersRepository);
  }
  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashViewBody:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => homeCubit,
            child: const HomeScreen(),
          ),
        );
      case charDetailsScreen:
        final character = settings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => HomeCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
