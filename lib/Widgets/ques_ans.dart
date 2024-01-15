import 'package:flutter/material.dart';

class QA extends StatefulWidget {
  const QA({Key? key}) : super(key: key);

  @override
  State<QA> createState() => _QAState();
}

class _QAState extends State<QA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [Center(child: Text('this is it'))]),
    ));
  }
}
