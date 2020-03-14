import 'package:flutter/material.dart';
import 'package:hacktheglobe2020/results.dart';

void main() => runApp(HomePage());

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
            //icon: Icon(Icons.local_hospital)
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 5)),
            border: OutlineInputBorder(),
            hintText: hintText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hacktheglobe2020",
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: TextTheme(
          display1: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
          display2: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent),
          display3: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent),
          display4: TextStyle(
              fontSize: 100, fontWeight: FontWeight.bold, color: Colors.black),
          body1: TextStyle(fontSize: 30),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Prescription Pad"),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Column(
          children: <Widget>[
            Text("Welcome, Dr. Arber",
                style: Theme.of(context).textTheme.body1),
            Text("Enter details below to view patient success rate",
                style: Theme.of(context).textTheme.display3),
            inputField("Medication name"),
            inputField("Patient age"),
            RaisedButton(
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Results()),
  );
},
              color: Colors.grey,
              splashColor: Colors.red,
              child: Text("Enter"),
            ),
          ],
        ),
      ),
    );
  }
}
