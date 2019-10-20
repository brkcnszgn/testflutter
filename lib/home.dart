import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _siraliDartDersleri();
  }

  Container _siraliDartDersleri() {
    return Container(
    child: Card(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // Aralarindaki bosluk esit olsun
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(2.0),
                  child: Text(
                    "D",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  color: Colors.redAccent,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(2.0),
                  child: Text("a",style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  color: Colors.redAccent,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(2.0),
                  child: Text("r",style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  color: Colors.redAccent,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(2.0),
                  child: Text("t",style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  color: Colors.redAccent,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              child: Text("D"),
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              child: Text("D"),
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              child: Text("D"),
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              child: Text("D"),
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              child: Text("D"),
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(2.0),
              child: Text("D"),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    ),
  );
  }
}
