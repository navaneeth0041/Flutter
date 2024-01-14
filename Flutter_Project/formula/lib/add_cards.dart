// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class Formula {
  String content;
  String latexContent;

  Formula(this.content, this.latexContent);
}

class FormulaPage extends StatefulWidget {
  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  List<Formula> formulas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: formulas.map((formula) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 300,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Math.tex(
                              formula.latexContent,
                              textStyle: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
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
                    _showAddFormulaBottomSheet(context);
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
      backgroundColor: Colors.grey[900],
    );
  }

  void _showAddFormulaBottomSheet(BuildContext context) {
    TextEditingController formulaController = TextEditingController();

    showModalBottomSheet(
      useSafeArea: false,
      showDragHandle: true,
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              TextField(
                controller: formulaController,
                decoration: InputDecoration(
                  hintText: 'Enter formula ',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  _saveFormula(value);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveFormula(formulaController.text);
                  Navigator.pop(context);
                },
                child: Text('Save',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveFormula(String formulaContent) {
    String latexContent = _convertToLatex(formulaContent);

    setState(() {
      formulas.add(Formula(formulaContent, latexContent));
    });
  }

  String _convertToLatex(String content) {
    return content;
  }
}
