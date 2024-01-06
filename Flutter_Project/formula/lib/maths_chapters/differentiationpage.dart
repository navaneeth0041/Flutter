// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_const

import 'package:flutter/material.dart';

class DifferentiationPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DifferentiationPageState createState() => _DifferentiationPageState();
}

class _DifferentiationPageState extends State<DifferentiationPage> with TickerProviderStateMixin{
  List<String> asset = [
    'assets/img/diff1.png',
    'assets/img/diff2.png',
    'assets/img/diff3.png',
    'assets/img/diff4.png',
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
              padding: EdgeInsets.all(40.0),
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
              height: 60,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 300,
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
                          setState(() {
                            
                          });
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
                      controller: TabController(length: asset.length,vsync: this,
                      initialIndex: currentindex
                      ),
                      selectedColor: Colors.grey,
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
