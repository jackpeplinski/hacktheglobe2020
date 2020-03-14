import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Results"),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "97%",
                style: Theme.of(context).textTheme.display3,
              ),
              Text(
                "chance of success",
                style: Theme.of(context).textTheme.body1,
              ),
            ],
          ),
          RaisedButton(
            onPressed: null,
            color: Colors.grey,
            splashColor: Colors.red,
          )
        ],
      ),
    );
  }
}
