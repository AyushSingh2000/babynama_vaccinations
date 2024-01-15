import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ValueNotifier<int>>.value(
        value: ValueNotifier<int>(
            0), //PageIndex is set to 0 to open first when when the app launches
        child: Menu(),
      ),
    );
  }
}
