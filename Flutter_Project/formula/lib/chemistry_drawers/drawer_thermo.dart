// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:formula/chemistry_chapters/thermo.dart';
import 'package:formula/add_cards.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawerThermo extends StatefulWidget {
  const HiddenDrawerThermo({super.key});

  @override
  State<HiddenDrawerThermo> createState() => _HiddenDrawerThermoState();
}

class _HiddenDrawerThermoState extends State<HiddenDrawerThermo> {
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
        ThermoDPage(),
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
