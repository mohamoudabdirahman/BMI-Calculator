// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:bmicalculator/utils/weightypes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _weight = TextEditingController();
  TextEditingController _height = TextEditingController();
  bool istapped = false;
  String _weightStatus = '';
  var thircal;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isempty = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _weight.dispose();
    _height.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 207, 207),
      appBar: AppBar(
        backgroundColor: Color(0xff2CA1BC),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 20, color: Colors.grey[200]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
          child: Stack(children: [
            istapped
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: mainColumn())
                : SizedBox(),
            istapped
                ? Column(
                    children: [
                      Center(
                        child: Container(
                          width: 350,
                          height: 550,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Result',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(8, 8),
                                                  color: Colors.grey,
                                                  blurRadius: 8,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  offset: Offset(-8, -8),
                                                  color: Color.fromARGB(
                                                          255, 245, 244, 244)
                                                      .withOpacity(0.8),
                                                  blurRadius: 6,
                                                  spreadRadius: 1)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    istapped = false;
                                                    _weight.text = '';
                                                    _height.text = '';
                                                    isempty = false;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 20,
                                                )),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(8, 8),
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            spreadRadius: 1),
                                        BoxShadow(
                                            offset: Offset(-8, -8),
                                            color: Color.fromARGB(
                                                    255, 245, 244, 244)
                                                .withOpacity(0.8),
                                            blurRadius: 6,
                                            spreadRadius: 1)
                                      ]),
                                  child: Center(
                                      child: Center(
                                    child: Text(
                                      calculate(),
                                      style: TextStyle(
                                          fontSize: 60,
                                          color: Color(0xff2CA1BC),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                status(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 51, 50, 50),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Status(
                                        colorWeightType: Colors.lightBlue,
                                        weightType: 'Under body weight'),
                                    Status(
                                        colorWeightType: Colors.lightGreen,
                                        weightType: 'Normal body weight'),
                                    Status(
                                        colorWeightType: Colors.orange,
                                        weightType: 'Over body weight'),
                                    Status(
                                        colorWeightType: Colors.red,
                                        weightType: 'Obsedity body weight')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : mainColumn()
          ]),
        ),
      ),
    );
  }

  String status() {
    if (thircal <= 18.5) {
      return 'You have under body weight';
    }
    if (thircal <= 24.9) {
      return 'You have Normal body weight';
    }
    if (thircal <= 29.99) {
      return 'You have Over body weight';
    }
    if (thircal >= 30) {
      return 'You have obsedity body weight';
    }
    return '';
  }

  String calculate() {
    double fircal = int.parse(_height.text) / 100;
    double seccal = fircal * 2;
    thircal = int.parse(_weight.text) / seccal;
    return thircal.toStringAsFixed(1);
  }

  Widget mainColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color:
                          Color.fromARGB(255, 209, 207, 207).withOpacity(0.8),
                      border: isempty
                          ? Border.all(width: 1, color: Colors.red)
                          : Border.all(
                              width: 0,
                              color: Color.fromARGB(255, 209, 207, 207)
                                  .withOpacity(0.8)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(8, 8),
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 1),
                        BoxShadow(
                            offset: Offset(-8, -8),
                            color: Color.fromARGB(255, 245, 244, 244)
                                .withOpacity(0.8),
                            blurRadius: 6,
                            spreadRadius: 1)
                      ]),
                  child: Center(
                    child: TextFormField(
                      controller: _weight,
                      style: TextStyle(fontSize: 45),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight(KG)',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color:
                          Color.fromARGB(255, 209, 207, 207).withOpacity(0.8),
                      border: isempty
                          ? Border.all(width: 1, color: Colors.red)
                          : Border.all(
                              width: 0,
                              color: Color.fromARGB(255, 209, 207, 207)
                                  .withOpacity(0.8)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(8, 8),
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 1),
                        BoxShadow(
                            offset: Offset(-8, -8),
                            color: Color.fromARGB(255, 245, 244, 244)
                                .withOpacity(0.8),
                            blurRadius: 6,
                            spreadRadius: 1)
                      ]),
                  child: Center(
                    child: TextFormField(
                      controller: _height,
                      style: TextStyle(fontSize: 45),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height(Cm)',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        isempty
            ? Text("Weight and Height cannot be empty",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ))
            : SizedBox(
                width: 0,
                height: 0,
              ),
        SizedBox(
          height: 50,
        ),
        MaterialButton(
          onPressed: () {
            if (_weight.text.isEmpty || _height.text.isEmpty) {
              setState(() {
                isempty = true;
              });
            } else {
              setState(() {
                istapped = true;
              });
            }
          },
          minWidth: 300,
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Color(0xff2CA1BC),
          child: Text(
            "Let's Calculate",
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey[200],
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Status(
                  colorWeightType: Colors.lightBlue,
                  weightType: 'Under body weight'),
              Status(
                  colorWeightType: Colors.lightGreen,
                  weightType: 'Normal body weight'),
              Status(
                  colorWeightType: Colors.orange,
                  weightType: 'Over body weight'),
              Status(
                  colorWeightType: Colors.red,
                  weightType: 'Obsedity body weight')
            ],
          ),
        )
      ],
    );
  }
}
