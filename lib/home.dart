import 'package:flutter/material.dart';
import 'package:hacktheglobe2020/results.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                inputField(
                    "BMI",
                    onSubmitted: (text) {
                        BMI = int.parse(text);
                    }),
                inputField(
                    "Salary",
                    onSubmitted: (text) {
                      salary = int.parse(text);
                    }),
                inputField(
                    "Years of schooling",
                    onSubmitted: (text) {
                      edu_status = int.parse(text);
                    }),
                inputField(
                    "Relationship status [never married, married, divorced]",
                    onSubmitted: (text) {
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
                    }),
                inputField(
                    "No. of children",
                    onSubmitted: (text) {
                      children = int.parse(text);
                    }),
                inputField("No. of work hours",
                    onSubmitted: (text) {
                      work_wk = int.parse(text);
                    }),
                inputField("Pain tolerance (scale 1-10)",
                    onSubmitted: (text) {
                      pain_tol = int.parse(text);
                    }),
                inputField("Cigarette per week",
                    onSubmitted: (text) {
                      smoke = int.parse(text);
                    }),
                inputField("Weekly alcohol consumption (days per week)",
                    onSubmitted: (text) {
                      alc = int.parse(text);
                    })
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
        var exp = -1.888012e1 + 1.0076e0 * BMI + 1.202803e-07 * salary +
            5.383947e-1 * edu_status + 8.152859e-2 * never_married +
            3.626329e-1 * married + -7.240816e-1 * divorced + 1.250288e-1 * children +
            7.388244e-2 * work_wk + 6.643426e-2 * pain_tol + -7.861881e-1 * smoke +
            -2.615533e-3 * alc;
        var risk = pow(e, exp);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultsPage(context, "second", arguments: {"risk" :
          risk.toString()})),
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
