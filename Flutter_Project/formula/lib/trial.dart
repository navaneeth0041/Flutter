// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Formula {
  String content;

  Formula(this.content);
}

class FormulaPage extends StatefulWidget {
  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  List<Formula> formulas = [];
  TextEditingController formulaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Formula App'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: formulas.map((formula) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        elevation: 5, // Add shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white, // White background
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              formula.content,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 270,
              ),
              Container(
                alignment: Alignment(0, 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _showAddFormulaDialog(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      backgroundColor: Colors.grey[900], // Black background
    );
  }

  void _showAddFormulaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Formula'),
          content: TextField(
            controller: formulaController,
            decoration: InputDecoration(hintText: 'Enter formula content'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  formulas.add(Formula(formulaController.text));
                  formulaController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
