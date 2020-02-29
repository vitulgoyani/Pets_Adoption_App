import 'package:flutter/material.dart';

import 'ui/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<int, Color> color = {
    50: Color.fromRGBO( 1,2,3, .1),
    100: Color.fromRGBO(1,2,3, .2),
    200: Color.fromRGBO(1,2,3, .3),
    300: Color.fromRGBO(1,2,3, .4),
    400: Color.fromRGBO(1,2,3, .5),
    500: Color.fromRGBO(1,2,3, .6),
    600: Color.fromRGBO(1,2,3, .7),
    700: Color.fromRGBO(1,2,3, .8),
    800: Color.fromRGBO(1,2,3, .9),
    900: Color.fromRGBO(1,2,3, 1),
  };
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xff497473, color);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorCustom,
        primarySwatch: colorCustom,
      ),
      home: HomePage(),
    );
  }
}

