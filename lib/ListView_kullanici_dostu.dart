import 'package:flutter/material.dart';

class ListView_2 extends StatefulWidget {
  @override
  _ListView_2State createState() => _ListView_2State();
}

class _ListView_2State extends State<ListView_2> {
  List<Ogrenci> allStudent = [];

  @override
  Widget build(BuildContext context) {
    //olusturulan liste tetiklenir. build methoduyla beraber.
    getToStudent();

    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, position) => Card(
        /*
        * diger kullanimi
        * itemBuilder:(context, position{
        * return widget(Card vb.)}*/
        elevation: 4,
        color:  position%2==0 ? Colors.pink : Colors.blueAccent,
        child: ListTile(
          leading: Icon(Icons.accessibility),
          title: Text(allStudent[position].surname),
          subtitle: Text(allStudent[position].name),
          trailing: Icon(Icons.map),
        ),
      ),
    );
  }

  void getToStudent() {
    allStudent = List.generate(
      300,
      (position) => Ogrenci(position % 2 == 0 ? true : false,
          "Ogrenci $position adi", 1, "Ogrenci $position soyadi"),
    );
  }
}

class Ogrenci {
  String name;
  String surname;
  int number;
  bool cinsiyet;

  Ogrenci(this.cinsiyet, this.name, this.number, this.surname);
}
