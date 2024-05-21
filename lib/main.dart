import 'package:cima_app/cima_app.dart';
import 'package:cima_app/core/utils/functions/hive_part.dart';
import 'package:cima_app/core/utils/services_locator.dart';
import 'package:cima_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await hivePart();
  setupServicesLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const CimaApp());
}
