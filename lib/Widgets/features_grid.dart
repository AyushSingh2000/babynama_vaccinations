import 'package:flutter/material.dart';

import '../colors.dart';

class FeatureGrid extends StatefulWidget {
  final Function(int) onGridItemTap;
  const FeatureGrid({Key? key, required this.onGridItemTap}) : super(key: key);

  @override
  State<FeatureGrid> createState() => _FeatureGridState();
}

class _FeatureGridState extends State<FeatureGrid> {
  final List<Color> colorList = [
    Color(0XFFCE93D8),
    Color(0XFFF4FF81),
    Pallete.txt5color,
    Color(0XFF80D8FF),
    Color(0XFFF8BBD0),
    Color(0XFFFF8A80),
    Color(0XFFFFE082),
  ];
  final List<Map<String, dynamic>> gridMap = [
    {
      'icon': "assets/technical-support.png",
      'boxtxt': "Questions &\n   Answers",
    },
    {
      'icon': "assets/doctor (1).png",
      'boxtxt': "Consult a\n  Doctor",
    },
    {
      'icon': "assets/family.png",
      'boxtxt': "       Join\nCommunity",
    },
    {
      'icon': "assets/calendar (1).png",
      'boxtxt': "Milestones",
    },
    {
      'icon': "assets/baby-boy (1).png",
      'boxtxt': " Track\nGrowth",
    },
    {
      'icon': "assets/coronavirus.png",
      'boxtxt': "       Track\n Vaccination",
    },
    {
      'icon': "assets/mental-health.png",
      'boxtxt': "     Autism\nDetection Test",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 172),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              widget.onGridItemTap(
                  index); // Call the callback function with the index
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: colorList[index % colorList.length],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.asset(
                      "${gridMap.elementAt(index)['icon']}",
                      height: 100,
                    ),
                  ),
                  Text(
                    "${gridMap.elementAt(index)['boxtxt']}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Pallete.txt1color,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
