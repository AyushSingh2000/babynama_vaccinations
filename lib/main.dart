import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'file_handler.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FileHandler fileHandler;

  late List<Map<String, dynamic>> vaccineData;

  @override
  void initState() {
    fileHandler = FileHandler();
    getVaccineData();
    super.initState();
  }

  void getVaccineData() async {
    vaccineData = await fileHandler.readFile();
  }

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
