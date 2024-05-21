import 'package:cima_app/cima_app.dart';
import 'package:cima_app/core/utils/functions/hive_part.dart';
import 'package:flutter/material.dart';

void main() async {
  await hivePart();
  runApp(const CimaApp());
}
