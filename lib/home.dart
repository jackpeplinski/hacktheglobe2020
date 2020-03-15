import 'package:flutter/material.dart';
import 'package:hacktheglobe2020/results.dart';
import 'dart:math';

var BMI = 0;
var salary = 0;
var edu_status = 0;
var never_married = 0;
var married = 0;
var divorced = 0;
var children = 0;
var work_wk = 0;
var pain_tol = 0;
var smoke = 0;
var alc = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget inputField(String hintText) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
            border: OutlineInputBorder(),
            hintText: hintText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription Pad"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("Welcome, Dr. Arber",
                      style: Theme.of(context).textTheme.display4),
                ),
                Text("Enter details below to view patient success rate",
                    style: Theme.of(context).textTheme.body1),

                inputField("First name"),
                inputField("Last name"),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                        hintText: "BMI"),
                        onChanged: (text) {
                        BMI = int.parse(text);
                        })
                ),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "Salary"),
                        onChanged: (text) {
                          salary = int.parse(text);
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "Years of schooling"),
                        onChanged: (text) {
                          edu_status = int.parse(text);
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "Relationship status [never married, married, divorced]"),
                        onChanged: (text) {
                          switch(text) {
                            case "never married":
                              {
                                never_married = 1;
                                married = 0;
                                divorced = 0;
                              }
                              break;
                            case "married":
                              {
                                never_married = 0;
                                married = 1;
                                divorced = 0;
                              }
                              break;
                            case "divorced":
                              {
                                never_married = 0;
                                married = 0;
                                divorced = 1;
                              }
                          }
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "No. of children"),
                        onChanged: (text) {
                          children = int.parse(text);
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "No. of work hours"),
                        onChanged: (text) {
                          work_wk = int.parse(text);
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "Pain tolerance (scale 1-10)"),
                        onChanged: (text) {
                          pain_tol = int.parse(text);
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "Cigarettes per week"),
                        onChanged: (text) {
                          smoke = int.parse(text);
                        })),

                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 150, left: 150),
                    child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
                            border: OutlineInputBorder(),
                            hintText: "Weekly alcohol consumption (days per week)"),
                        onChanged: (text) {
                          alc = int.parse(text);
                        }))

              ],
            ),
          ),
          ToResultsButton(),
        ],
      ),
    );
  }
}

class ToResultsButton extends StatefulWidget {
  @override
  _ToResultsButtonState createState() => _ToResultsButtonState();
}

class _ToResultsButtonState extends State<ToResultsButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        var exp = -1.888012e1 + 1.0076e0 * BMI + 1.202803e-7 * salary +
            5.383947e-1 * edu_status + 8.152859e-2 * never_married +
            3.626329e-1 * married + -7.240816e-1 * divorced + 1.250288e-1 * children +
            7.388244e-2 * work_wk + 6.643426e-2 * pain_tol + -7.861881e-1 * smoke +
            -2.615533e-3 * alc;
        var risk = pow(e, exp);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultsPage(risk.toString())),
        );
      },
      color: Colors.grey,
      splashColor: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
        child: Text(
          "Enter",
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    );
  }
}
