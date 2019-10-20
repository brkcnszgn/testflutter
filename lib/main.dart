import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/Buttons.dart';
import 'package:testflutter/CardView.dart';
import 'package:testflutter/customWidget.dart';

import 'home.dart';

void main() {
  //Custom Widget disaridan statefull olarak olusturulup main methodu icersinde tanimlanarak uygulama icin return edilip calistirabilir.
  var customWidget = CustomWidget();
  var count = 0;
  runApp(myHomePage()); //runApp methodu gelen widget methodunu ekranda gosterir
}

// ignore: camel_case_types
class myHomePage extends StatefulWidget {
  int count = 0;

  void Count() {
    debugPrint("Count Degistirildi");
    count++;
  }
  void Count2() {
    debugPrint("Count Degistirildi");
    count--;
  }

  //StateFull alaninin cache alani denebilir.
  @override
  State<StatefulWidget> createState() {
    debugPrint("Create State tetiklendi");
    // TODO: implement createState
    return MyHomePage();
  }
}

class MyHomePage extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build methodu tetiklendi");
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber, accentColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "Test App Flutter",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Buttona tiklandi");
            setState(() {
              debugPrint("FloatButton setState calisti");
              widget.Count();
            });
          },
          child: Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                 setState(() {
                   widget.Count2();
                 });
                },
                child: Text("Azalt"),
              ),
              Text("Click time for Button : "),
              Text(
                "${widget.count}",
                style: Theme.of(context).textTheme.display1.copyWith(//copyWith varolan theme icindeki textstyle ozelliklerini ezebiliriz.
                  color: widget.count < 0 ? Colors.red : Colors.blueAccent, //Kisa if kullanim sekli
                )
              ),
              RaisedButton(
                onPressed: () {
                 setState(() {
                   widget.Count();
                 });
                },
                child: Text("Cogalt"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container _bodyContainer() {
  return Container(
      color: Colors.redAccent,
      constraints: BoxConstraints(
        minWidth: 250,
        minHeight: 250,
        maxWidth: 250,
        maxHeight: 350,
      ),
      child: Card(
        margin: EdgeInsets.all(20.0),
        elevation: 12.0,
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 35.0,
                          color: Colors.white,
                        ),
                        color: Colors.pinkAccent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 35.0,
                          color: Colors.black,
                        ),
                        color: Colors.pinkAccent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 35.0,
                          color: Colors.yellowAccent,
                        ),
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    color: Colors.pinkAccent,
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: Container(
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 35.0,
                      color: Colors.black,
                    ),
                    color: Colors.pinkAccent,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 35.0,
                      color: Colors.yellowAccent,
                    ),
                    color: Colors.pinkAccent,
                  ),
                  flex: 8,
                ),
              ]),
        ),
      ));
}

Widget get _floatingButton {
  return FloatingActionButton(
    onPressed: () {
      debugPrint("Buttona tiklandi");
    },
    child: Icon(
      Icons.add_circle_outline,
      color: Colors.white,
    ),
  );
}

Widget get _centerText {
  return Center(
    child: Container(
      child: Text("Center Text"),
      color: Colors.red,
    ),
  );
}
/*Notlar

 Yararli kisayollar Alt + enter

 --Ekrana sigmayan resimler icin IntrinsicHeight(child : kullanmak zorundayiz)
  Internetten ya da servisten gec yuklenen resimler icin FadeInImage.assetNetwork(yuklenmeden onceki gosterilecek resim, gosterilecek resim) seklinde karmasa onlenebilir.

 Kullanilan widgetlar icinde istege gore yerlestirmek isteniyorsa en disini Expanded widgeti ile sarilmali
 Bottom degeri 1 top degeri -1 right degeri 1 left degeri 0
Belirlenin widget her nerede gosterilecekse 0.1 0.2 gibi seklinde tasinabilir.
bunlar ornek olarak kisayollari ise Bottom.center start.center gibi olabilir.
 disarda widget olusturup iceriye fonksiyonunu yazabiliriz bu sayede
karmasa olmayacaktir

//stateless ve ya statefull widgetlar icerisinde parametreleri zorunlu kilabiliriz. Bunun icin
//olusturulan custom widget icinde
 ornegin
 String title;
  myHomePage({String title}){
  this.title = title;
  }   bu sekilde constructor olusturulmus oldu.
  ya da stateless icerisinde ise bu durum
  final String title;
  myHomePage({this.title}); seklinde tanimlanir.

 */
