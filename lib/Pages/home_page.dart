import 'package:babynama_vaccinations/Widgets/autism_test.dart';
import 'package:babynama_vaccinations/Widgets/consult_doc.dart';
import 'package:babynama_vaccinations/Widgets/growth.dart';
import 'package:babynama_vaccinations/Widgets/milestones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/custom_container.dart';
import '../Widgets/features_grid.dart';
import '../Widgets/ques_ans.dart';
import '../Widgets/vaccine_page.dart';
import '../colors.dart';
import '../file_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            context,
            MaterialPageRoute(
                builder: (context) => VaccinePage(vaccineData: vaccineData)));
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                    Provider.of<ValueNotifier<int>>(context, listen: false)
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
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 450,
              color: Pallete.txt6color,
              child: Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Pallete.txt2color,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history_rounded,
                  size: 28,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Appointment History',
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              CustomContainer(
                  onTap: () {},
                  text1: 'Find Perfect Child Care:\nExplore our Care Plans',
                  imgtext: 'assets/mother (1)gkbkj.png',
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
