import 'package:flutter/material.dart';

import '../colors.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {required this.onTap,
      required this.text1,
      required this.imgtext,
      required this.fntsize,
      Key? key})
      : super(key: key);
  VoidCallback onTap;
  String text1;
  String imgtext;
  double fntsize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Stack(
            children: <Widget>[
              Container(
                height: 132,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 118,
                decoration: BoxDecoration(
                  color: Pallete.txt7color,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          height: 90,
                          width: 78,
                          child: Image.asset(
                            imgtext,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            text1,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: fntsize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 1.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Pallete.txt1color,
                              size: 23,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
