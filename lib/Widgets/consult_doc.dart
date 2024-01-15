import 'package:flutter/material.dart';

class ConsultDoctor extends StatefulWidget {
  const ConsultDoctor({Key? key}) : super(key: key);

  @override
  State<ConsultDoctor> createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [Center(child: Text('this is it'))]),
    ));
  }
}
