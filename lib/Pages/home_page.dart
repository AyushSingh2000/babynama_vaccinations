import 'package:babynama_vaccinations/Widgets/autism_test.dart';
import 'package:babynama_vaccinations/Widgets/consult_doc.dart';
import 'package:babynama_vaccinations/Widgets/custom_container.dart';
import 'package:babynama_vaccinations/Widgets/growth.dart';
import 'package:babynama_vaccinations/Widgets/milestones.dart';
import 'package:babynama_vaccinations/Widgets/vaccination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/features_grid.dart';
import '../Widgets/ques_ans.dart';
import '../colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void handleGridItemTap(int index) {
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
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Growth()));
        print('Tapped on "Questions  Answers"');
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Vaccinations()));
        print('Tapped on " Vaccination"');
        break;
      case 6:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AutismDetection()));
        print('Tapped on "Con Doctor"');
        break;
      // Add more cases for other grid items...

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.menu_rounded,
                          color: Pallete.txt3color,
                          size: 30,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          child: Image.asset('assets/logo-new.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<ValueNotifier<int>>(context,
                                    listen: false)
                                .value = 2;
                          },
                          child: Icon(Icons.account_circle_rounded,
                              size: 50, color: Pallete.txt6color),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              CustomContainer(
                  onTap: () {},
                  text1: 'Find Perfect Child Care:\nExplore our Care Plans',
                  imgtext: 'assets/mother.png',
                  fntsize: 19),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: FeatureGrid(onGridItemTap: handleGridItemTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
