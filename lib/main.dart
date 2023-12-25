import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/features/settings/settings_controller.dart';
import 'src/features/settings/settings_service.dart';
import 'src/src.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initInjection();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
