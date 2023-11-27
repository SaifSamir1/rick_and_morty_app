import 'package:bloc/bloc.dart';
import 'package:charachters_info_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

import 'core/utils/bloc_observer.dart';

void main() {


  Bloc.observer = MyBlocObserver();

  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
