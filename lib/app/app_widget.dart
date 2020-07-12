import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.orange,
          fontFamily: 'Open Sans',
          primaryColor: Colors.orange,
          backgroundColor: Colors.white,
          cursorColor: Colors.orange,
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.transparent),
      title: 'Flutter Music App',
      navigatorKey: Modular.navigatorKey,
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
