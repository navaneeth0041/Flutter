// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:formula/maths_chapters/staright.dart';
import 'package:formula/add_cards.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawerStraight extends StatefulWidget {
  const HiddenDrawerStraight({super.key});

  @override
  State<HiddenDrawerStraight> createState() => _HiddenDrawerStraightState();
}

class _HiddenDrawerStraightState extends State<HiddenDrawerStraight> {
  List<ScreenHiddenDrawer> _pages = [];

  get name => null;
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'FormulaHub Cards',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.black,
        ),
        StraightPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'My Cards',
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.white,
          ),
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.black,
        ),
        FormulaPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.grey.shade800,
      screens: _pages,
      initPositionSelected: 0,
      backgroundColorAppBar: Colors.black,
      leadingAppBar: Icon(
        Icons.menu,
        color: Colors.white,
        size: 30,
      ),
      isTitleCentered: true,
      slidePercent: 70,
      tittleAppBar: Text(
        'Formula cards',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
