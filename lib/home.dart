import 'package:flutter/material.dart';
import 'package:hacktheglobe2020/results.dart';

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
                inputField("BMI"),
                inputField("Salary"),
                inputField("No. of children"),
                inputField("No. of work hours"),
                inputField("Weekly alcohol consumption")
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultsPage()),
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
