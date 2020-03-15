import 'package:flutter/material.dart';

import 'home.dart';

class ResultsPage extends StatelessWidget {

  final risk;
  ResultsPage(this.risk);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Results"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              risk,
              style: Theme.of(context).textTheme.display4,
            ),
          ),
          Center(
            child: Text(
              " chance of opioid prescription success",
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          //Image.asset('assets/medicineBottle.png'),
          //submit prescription into data base
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage(risk)),
                );
              },
              color: Colors.grey,
              splashColor: Colors.red,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                child: Text(
                  "Submit prescription to data base",
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
          ),
          SizedBox(height:20),
          //enter new prescription
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              color: Colors.grey,
              splashColor: Colors.red,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                child: Text(
                  "Enter new prescription",
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
