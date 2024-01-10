// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_const, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WorkEPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _WorkEPageState createState() => _WorkEPageState();
}

class _WorkEPageState extends State<WorkEPage>
    with TickerProviderStateMixin {
  List<String> asset = [
    'assets/img/we1.png',
    'assets/img/we2.png',
    'assets/img/we3.png',
    'assets/img/we4.png',
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.all(30.0),
            //   child: Center(
            //     child: Text(
            //       "Formula Cards",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //         fontSize: 30,
            //         letterSpacing: 0.7,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 375,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: PageController(
                          initialPage: 0,
                          viewportFraction: 0.8,
                        ),
                        itemCount: asset.length,
                        // padEnds: false,
                        physics: BouncingScrollPhysics(),
                        onPageChanged: (value) {
                          currentindex = value;
                          setState(() {});
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Image.asset(asset[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TabPageSelector(
                      controller: TabController(
                          length: asset.length,
                          vsync: this,
                          initialIndex: currentindex),
                      selectedColor: Colors.grey[400],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 280,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
