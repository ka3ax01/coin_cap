import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:coin_cap/models/app_config.dart';
import 'package:coin_cap/pages/home_page.dart';
import 'package:coin_cap/services/http_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHTTPService();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String configContent = await rootBundle.loadString("assets/config/main.json");
  Map configData = jsonDecode(configContent);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
      COIN_API_BASE_URL: configData["COIN_API_BASE_URL"],
    ),
  );
}

void registerHTTPService() {
  GetIt.instance.registerSingleton(
    HTTPService(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COinCap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(88, 60, 197, 1.0),
      ),
      home: HomePage(),
    );
  }
}
