import 'package:flutter/material.dart';

//stateLess ekrana bir kez yazilir  -- statefull degisebilenWidgetlardir
class CustomWidget extends StatefulWidget {
  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // tersine ozellikleri cevirir
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              debugPrint("Giris buttonuna tiklandi");
              debugPrint("Ikinci Satir");
            },
            child: Text("Giris"),
            elevation: 8,
            textColor: Colors.white,
            color: Colors.deepOrange,
          ),
          RaisedButton(
            onPressed: () {
              debugPrint("Giris buttonuna tiklandi");
              debugPrint("Ikinci Satir");
            },
            child: Text("Register"),
            elevation: 8,
            textColor: Colors.white,
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Login"),
            elevation: 12,
            textColor: Colors.white,
            color: Colors.pinkAccent,
          ),
          IconButton(
            icon: Icon(
              Icons.ac_unit,
              size: 32,
            ),
            onPressed: () {},
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Burakcan",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),),
            color: Colors.blueAccent,

          )
        ],
      ),
    );
  }
}

