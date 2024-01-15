import 'package:babynama_vaccinations/Widgets/ques_ans.dart';
import 'package:babynama_vaccinations/Widgets/tabs.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'consult_doc.dart';
import 'milestones.dart';

class Vaccinations extends StatefulWidget {
  const Vaccinations({Key? key}) : super(key: key);

  @override
  State<Vaccinations> createState() => _VaccinationsState();
}

class _VaccinationsState extends State<Vaccinations> {
  void handleGridTap(int index, String? selectedValue) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => QA()));
        print('Tapped on "Questions & Answers"');
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ConsultDoctor()));
        print('Tapped on "Consult a Doctor"');
        break;
      case 2:
        print('Tapped on "Join community"');
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Milestones()));
        print('Tapped on "Consult a "');
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 14),
                child: InkWell(
                  // onTap: () {
                  //   // var navigationProvider =
                  //   //     Provider.of<NavigationProvider>(context, listen: false);
                  //   // navigationProvider
                  //   //     .setPreviousPage(ModalRoute.of(context)!.settings.name ?? '');
                  //   //
                  //   // // Navigate back to the HomePage
                  //   // Navigator.popUntil(
                  //   //     context, ModalRoute.withName(HomePage.routeName));
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (BuildContext context) => HomePage()));
                  // },
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Pallete.txt1color,
                    size: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Track Vaccination',
                    style: TextStyle(
                      color: Pallete.txt1color,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 100, child: Image.asset('assets/baby.png')),
              Container(
                  height: 100, child: Image.asset('assets/vaccination.png')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: VaccineGrid(onGridTap: handleGridTap),
          ),
        ]),
      ),
    ));
  }
}
