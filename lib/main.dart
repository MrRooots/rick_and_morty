import 'package:flutter/material.dart';

import 'package:rick_and_morty/service_locator.dart';
import 'package:rick_and_morty/internal/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(const MyApp());
}
