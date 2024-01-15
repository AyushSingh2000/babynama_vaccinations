import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/acoount.dart';
import 'Pages/home_page.dart';
import 'Pages/profile.dart';
import 'colors.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _navigateBottomBar(int index) {
    Provider.of<ValueNotifier<int>>(context, listen: false).value = index;
  }

  final List<Widget> _pages = [HomePage(), Accounts(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[Provider.of<ValueNotifier<int>>(context).value],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
              color: Pallete.txt1color,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(color: Pallete.txt3color),
          unselectedItemColor: Pallete.txt3color,
          selectedItemColor: Pallete.txt1color,
          currentIndex: Provider.of<ValueNotifier<int>>(context).value,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: Provider.of<ValueNotifier<int>>(context, listen: false)
                            .value ==
                        0
                    ? Pallete.txt1color
                    : Pallete.txt3color,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded,
                  size: 30,
                  color: Provider.of<ValueNotifier<int>>(context, listen: false)
                              .value ==
                          1
                      ? Pallete.txt1color
                      : Pallete.txt3color),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded,
                  size: 30,
                  color: Provider.of<ValueNotifier<int>>(context, listen: false)
                              .value ==
                          2
                      ? Pallete.txt1color
                      : Pallete.txt3color),
              label: 'Profile',
            ),
          ],
        ));
  }
}
