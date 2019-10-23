import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ListView_Seperator extends StatefulWidget {
  @override
  _ListView_SeperatorState createState() => _ListView_SeperatorState();
}

/*
* Disardan package yukleme ve Toast && Listedeki elemana Click*/

class _ListView_SeperatorState extends State<ListView_Seperator> {
  List<Ogrenci> allStudent = [];

  @override
  Widget build(BuildContext context) {
    //olusturulan liste tetiklenir. build methoduyla beraber.
    getToStudent();

    return ListView.separated(
      separatorBuilder: (context, position) {
        if (position % 4 == 0 && position != 0) {
        return  Container(
            height: 2,
            color: Colors.deepOrange,
          );
        }else{
          return Container();
        }

      },

      itemCount: 20,
      itemBuilder: (context, position) =>
          Card(
            /*
        * diger kullanimi
        * itemBuilder:(context, position{
        * return widget(Card vb.)}*/
            elevation: 4,
            color: position % 2 == 0 ? Colors.pink : Colors.blueAccent,
            child: ListTile(
              leading: Icon(Icons.accessibility),
              title: Text(allStudent[position].surname),
              subtitle: Text(allStudent[position].name),
              trailing: Icon(Icons.map),
              //listviewdeki elemani consola yazdirma
              onTap: (){
                //listeki tiklanan elemanin ne yapacagi
                debugPrint("Secilen eleman $position");
              },
              onLongPress: (){
                debugPrint("Uzun basilan eleman $position");
               showToast("Burakcanasdasdasdasdasdasdasdasdadsasdasdadsa",gravity:Toast.BOTTOM,duration: Toast.LENGTH_LONG);
              },
            ),
          ),
    );
  }

  void getToStudent() {
    allStudent = List.generate(
      300,
          (position) =>
          Ogrenci(position % 2 == 0 ? true : false,
              "Ogrenci $position adi", 1, "Ogrenci $position soyadi"),
    );
  }
  void showToast(String msg,{ int gravity, int duration}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}

class Ogrenci {
  String name;
  String surname;
  int number;
  bool cinsiyet;

  Ogrenci(this.cinsiyet, this.name, this.number, this.surname);
}
