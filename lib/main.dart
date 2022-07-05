import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(const MyApp());
}
