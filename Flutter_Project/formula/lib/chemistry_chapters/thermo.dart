// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_const, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ThermoDPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ThermoDPageState createState() => _ThermoDPageState();
}

class _ThermoDPageState extends State<ThermoDPage> with TickerProviderStateMixin {
  List<String> asset = [
    'assets/img/tc1.png',
    'assets/img/tc2.png',
    'assets/img/tc3.png',
    'assets/img/tc4.png',
    'assets/img/tc5.png',
    'assets/img/tc6.png',
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   leading: Icon(Icons.menu,color:Colors.white),
      //     backgroundColor: Colors.black,
      //     title:Text(
      //       'Integration',
      //       style: TextStyle(
      //         color: Colors.white,
      //         letterSpacing: 0.7,

      //       ),
      //     ) ,
      //     centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  "Formula Cards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
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
                      selectedColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 280,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(Icons.add),
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
