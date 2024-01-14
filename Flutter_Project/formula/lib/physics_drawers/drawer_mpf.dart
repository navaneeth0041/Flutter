// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:formula/physics_chapters/machanical_f.dart';
import 'package:formula/add_cards.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawerMPF extends StatefulWidget {
  const HiddenDrawerMPF({super.key});

  @override
  State<HiddenDrawerMPF> createState() => _HiddenDrawerMPFState();
}

class _HiddenDrawerMPFState extends State<HiddenDrawerMPF> {
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
        MechanicalFPage(),
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
