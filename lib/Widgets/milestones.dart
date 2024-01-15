import 'package:flutter/material.dart';

class Milestones extends StatefulWidget {
  const Milestones({Key? key}) : super(key: key);

  @override
  State<Milestones> createState() => _MilestonesState();
}

class _MilestonesState extends State<Milestones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [Center(child: Text('this is it'))]),
    ));
  }
}
