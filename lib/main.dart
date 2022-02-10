import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'locators.dart';
import 'services/pet_data_service.dart';
import 'views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocators();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<PetDataService>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetLEO',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        "/": (_) => Home(),
      },
    );
  }
}
