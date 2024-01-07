// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:formula/home.dart';
// import 'package:formula/home.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.1 * MediaQuery.of(context).size.width),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(0.05 * MediaQuery.of(context).size.width),
              child: Image.asset(
                'assets/img/elearning.png',
                height: 0.2 * MediaQuery.of(context).size.height,
              ),
            ),
            SizedBox(
              height: 0.04 * MediaQuery.of(context).size.height,
            ),
            Text(
              'FormulaHub',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                fontSize: 0.06 * MediaQuery.of(context).size.height,
                letterSpacing: 0.9,
              ),
            ),
            SizedBox(
              height: 0.01 * MediaQuery.of(context).size.height,
            ),
            Text(
              'Makes people easy to lead but, difficult to drive; easy to govern, but impossible to enslave',
              style: TextStyle(
                color: Colors.black,
                fontSize: 0.02 * MediaQuery.of(context).size.height,
                letterSpacing: 0.1,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 0.05 * MediaQuery.of(context).size.height,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => home_page()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    EdgeInsets.all(0.03 * MediaQuery.of(context).size.height),
                child: Center(
                  child: Text(
                    'Start Learning',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                      fontSize: 0.05 * MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
