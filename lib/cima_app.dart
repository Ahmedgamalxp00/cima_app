import 'package:cima_app/core/constants.dart';
import 'package:cima_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class CimaApp extends StatelessWidget {
  const CimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
