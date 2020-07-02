import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      title: 'Flutter Music App',
      navigatorKey: Modular.navigatorKey,
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,     
    );
  }
}