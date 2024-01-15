import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class ConsultDoctor extends StatefulWidget {
  const ConsultDoctor({Key? key}) : super(key: key);

  @override
  State<ConsultDoctor> createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Consult a Doctor',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(height: 200, child: Image.asset('assets/doctor (1).png')),
          SizedBox(
            height: 30,
          ),
          Text(
            'Book a Consultation\nGet a expert advice and guidance \nfor your baby\'s health and development',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                fixedSize: Size(210, 65)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Book Now',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 32,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFCE93D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                fixedSize: Size(220, 65)),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Appointments',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.white,
                  size: 28,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.txt7color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                fixedSize: Size(210, 65)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Prescription',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.note_alt_rounded,
                  color: Colors.white,
                  size: 32,
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
