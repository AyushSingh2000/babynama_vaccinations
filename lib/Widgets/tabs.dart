import 'package:flutter/material.dart';

import '../colors.dart';

class VaccineGrid extends StatefulWidget {
  final Function(int, String?) onGridTap;
  const VaccineGrid({Key? key, required this.onGridTap}) : super(key: key);

  @override
  State<VaccineGrid> createState() => _VaccineGridState();
}

class _VaccineGridState extends State<VaccineGrid> {
  final List<Color> colorList = [
    Color(0XFFCE93D8),
    Color(0XFFF4FF81),
    Pallete.txt5color,
    Color(0XFF80D8FF),
  ];
  final List<Map<String, dynamic>> gridMap = [
    {
      'icon': "assets/clock.png",
      'boxtxt': "Past Due Vaccines",
    },
    {
      'icon': "assets/upcoming.png",
      'boxtxt': "Upcoming doses",
    },
    {
      'icon': "assets/loading.png",
      'boxtxt': "Doses Complete",
    },
    {
      'icon': "assets/project.png",
      'boxtxt': "All Vaccine Status",
    },
  ];
  final List<List<String>> dropdownOptions = [
    ['Option A', 'Option B', 'Option C'],
    ['Option X', 'Option Y', 'Option Z'],
    ['Option 1', 'Option 2', 'Option 3'],
    ['Option Alpha', 'Option Beta', 'Option Gamma'],
  ];

  // Store the selected values for each dropdown
  Map<int, String?> selectedDropdownValues = {};
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 178),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              // Call the callback function with the index and selected dropdown value
              widget.onGridTap(index, selectedDropdownValues[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: Pallete.txt5color, //Color(0XFFFFE082),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      "${gridMap.elementAt(index)['icon']}",
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${gridMap.elementAt(index)['boxtxt']}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Pallete.txt1color,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedDropdownValues[index],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDropdownValues[index] = newValue;
                      });
                    },
                    items: dropdownOptions[index]
                        .map<DropdownMenuItem<String>>(
                          (String option) => DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
