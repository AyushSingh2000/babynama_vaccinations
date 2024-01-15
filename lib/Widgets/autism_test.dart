import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../colors.dart';

class AutismDetection extends StatefulWidget {
  const AutismDetection({super.key});

  @override
  State<AutismDetection> createState() => _AutismDetectionState();
}

class _AutismDetectionState extends State<AutismDetection> {
  final List<bool> _answers = [
    true,
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    true
  ];
  final List<String> _autismQuestions = [
    "If you point at something across the room, does your child look at it?\n(For example, if you point at a toy or an animal, does your child look at the toy or animal?)",
    "Have you ever wondered if your child might be deaf?\n(For example, if your child does not respond to sounds or their name being called)",
    "Does your child play pretend or make-believe?\n(For example, pretend to drink from an empty cup, pretend to talk on a phone, or pretend to feed a doll or stuffed animal)",
    "Does your child like climbing on things?\n(For example, furniture, playground equipment, or stairs)",
    "Does your child make unusual finger movements near his or her eyes?\n(For example, does your child wiggle his or her fingers close to his or her eyes?)",
    "Does your child point with one finger to ask for something or to get help?\n(For example, pointing to a snack or toy that is out of reach)",
    "Does your child point with one finger to show you something interesting?\n(For example, pointing to an airplane in the sky or a big truck in the road)",
    "Is your child interested in other children?\n(For example, does your child watch other children, smile at them, or go to them?)",
    "Does your child show you things by bringing them to you or holding them up for you to see – not to get help, but just to share?\n(For example, showing you a flower, a stuffed animal, or a toy truck)",
    "Does your child respond when you call his or her name?\n(For example, does he or she look up, talk or babble, or stop what he or she is doing when you call his or her name?)",
    "When you smile at your child, does he or she smile back at you?",
    "Does your child get upset by everyday noises?\n(For example, a vacuum cleaner or loud music)",
    "Does your child walk?",
    "Does your child look you in the eye when you are talking to him or her, playing with him or her, or dressing him or her?",
    "Does your child try to copy what you do?\n(For example, wave bye-bye, clap, or make a funny noise when you do)",
    "If you turn your head to look at something, does your child look around to see what you are looking at?",
    "Does your child try to get you to watch him or her?\n(For example, does your child look at you for praise, or say 'look' or 'watch me')",
    "Does your child understand when you tell him or her to do something?\n(For example, if you don’t point, can your child understand 'put the book on the chair' or 'bring me the blanket')",
    "If something new happens, does your child look at your face to see how you feel about it?\n(For example, if he or she hears a strange or funny noise, or sees a new toy, will he or she look at your face?)",
    "Does your child like movement activities?\n(For example, being swung or bounced on your knee)",
  ];

  final List<String> _imageLinks = [
    "assets/peek.png",
    "assets/istockphoto-1398135630-612x612.jpg",
    "assets/world-children-day.png",
    "assets/ladder.png",
    "assets/thinking (1).png",
    "assets/thinking (1).png",
    "assets/thinking.png",
    "assets/polyamory.png",
    "assets/mother-day.png",
    "assets/book.png",
    "assets/familysmile.png",
    "assets/kkjbkjnbaby.png",
    "assets/girl.png",
    "assets/familyugjub.png",
    "assets/dad (1).png",
    "assets/peek.png",
    "assets/dad.png",
    "assets/boy.png",
    "assets/mother.png",
    "assets/swing.png",
  ];

  double _autismPercent = 0.0;
  int _index = 0;
  final PageController _pageController = PageController();
  bool _showResult = false;
  bool _showWelcomePage = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(450, 800),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: _showWelcomePage
                ? _welcomePage()
                : _showResult
                    ? _showResultScreen()
                    : Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: _autismQuestions.length,
                            onPageChanged: (int page) {
                              setState(() {
                                _index = page;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 10.w, top: 60.h),
                                    child: Text(
                                      "Q${index + 1}. ${_autismQuestions[index]}",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  Image.asset(
                                    _imageLinks[index],
                                    height: 220.h,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            fixedSize: Size(140.w, 45.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.w),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_answers[index]) {
                                              _autismPercent += 5;
                                            } else {
                                              _autismPercent -= 5;
                                            }
                                            if (index <
                                                _autismQuestions.length - 1) {
                                              _pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                            if (index == 19) {
                                              setState(() {
                                                _showResult = true;
                                              });
                                            }
                                          },
                                          child: Text(
                                            'YES',
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Pallete.txt2color,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                        SizedBox(width: 15.w),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Pallete.txt6color,
                                            fixedSize: Size(140.w, 45.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.w),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (!_answers[index]) {
                                              _autismPercent += 5;
                                            } else {
                                              _autismPercent -= 5;
                                            }
                                            if (index <
                                                _autismQuestions.length - 1) {
                                              _pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                            if (index == 19) {
                                              setState(() {
                                                _showResult = true;
                                              });
                                            }
                                          },
                                          child: Text(
                                            'NO',
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                color: Pallete.txt2color,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  )
                                ],
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 198.w),
                                  child: Text(
                                    '${_index + 1} of 20',
                                    style: TextStyle(
                                        fontSize: 23.sp,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
        );
      },
    );
  }

  Widget _showResultScreen() {
    return Container(
        height: 780.h,
        width: 450.w,
        color: Colors.white,
        child: _autismPercent > 60
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 32.w,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Test Results',
                        style: TextStyle(
                            fontSize: 26.sp,
                            color: Pallete.txt1color,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Your child is fine, nothing to worry',
                    style: TextStyle(
                        fontSize: 23.sp,
                        color: Pallete.txt1color,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  CircleAvatar(
                    radius: 100.w,
                    backgroundColor: Colors.indigoAccent,
                    backgroundImage: const AssetImage(
                      "assets/girl.png",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Screen again after the next birthday. No further action required unless screening indicates risk for Autism',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Pallete.txt1color,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 32.w,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Test Results',
                        style: TextStyle(
                            fontSize: 26.sp,
                            color: Pallete.txt1color,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Your child is at risk, please consult',
                    style: TextStyle(
                        fontSize: 23.sp,
                        color: Pallete.txt1color,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  CircleAvatar(
                    radius: 100.w,
                    backgroundColor: Colors.indigoAccent,
                    backgroundImage: const AssetImage(
                      "assets/doctor (1)bmb.png",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'The screening test for autism is positive. To confirm the diagnosis book a consultation with us or go to nearby pediatric neurologist',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Pallete.txt1color,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ));
  }

  Widget _welcomePage() {
    return Container(
      height: 780.h,
      width: 450.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Welcome to Autism Test',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(height: 100, child: Image.asset('assets/vaccination.png')),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'The test consists of 20 yes-no questions based on child\'s behaviour. Please answer all the questions correctly.',
              style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff6a03c5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'If you have concerns about your child possibly having autism, what actions should you consider taking ?',
              style: TextStyle(
                  fontSize: 21.sp,
                  color: Pallete.txt1color,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Text(
              'Don\'t worry, it\'s just a suspicion, and your child could be fine. \n\nHowever,seeking professional advice for a thorough evaluation is recommended, as early intervention can make a positive impact.',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Pallete.txt1color,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          Center(
            child: Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 6.h,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.w))),
                onPressed: () async {
                  try {
                    final result = await InternetAddress.lookup('google.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                      setState(() {
                        _showWelcomePage = false;
                      });
                    }
                  } on SocketException catch (_) {
                    Fluttertoast.showToast(
                        msg: "Please connect to internet",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.orange,
                        textColor: Colors.white);
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: Text(
                    'START',
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Pallete.txt2color,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Recommended by WHO & American Academy of Pediatrics for child 18 months or older.',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Pallete.txt3color,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }
}
