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
          return Container(
            height: 2,
            color: Colors.deepOrange,
          );
        } else {
          return Container();
        }
      },
      itemCount: 20,
      itemBuilder: (context, position) => Card(
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
          onTap: () {
            //listeki tiklanan elemanin ne yapacagi
            debugPrint("Secilen eleman $position");
            //Kullandigimiz alertdialoga context ile baglaniyoruz // listview pozisyonundaki elemanlari yazdiriyoruz.
            alertGoster(context,position);
            //true false ile uzun mu kisa mi click islemini kontrol edioruz
            ToastMesaj(position, false);
          },
          onLongPress: () {
            debugPrint(allStudent[position].toString());
            ToastMesaj(position, true);
          },
        ),
      ),
    );
  }

  //listviewdeki nesnelerin pozisyonuna erismek icin get fonksiyonuna her tiklanin pozisyon esitleme
  get position => allStudent[position].toString();

  void ToastMesaj(int position, bool uzunTiklama) {
    showToast(
        uzunTiklama
            ? "Uzun tiklandi :" + allStudent[position].toString()
            : "Tek Tiklama :" + allStudent[position].toString(),
        gravity: Toast.BOTTOM,
        duration: Toast.LENGTH_LONG);
  }

  void getToStudent() {
    allStudent = List.generate(
      300,
      (position) => Ogrenci(position % 2 == 0 ? true : false,
          "Ogrenci $position adi", position++, "Ogrenci $position soyadi"),
    );
  }

  void showToast(String msg, {int gravity, int duration}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void alertGoster(BuildContext ctx, int position) {
    showDialog(
        context: ctx,
        barrierDismissible: true,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Uyari"),
            content: SingleChildScrollView(
                //SingleChildeScroolView icerisinde ListBody ile birden fazla widget yerlestirilebilir.
                child: ListBody(
              children: <Widget>[
                Text("Ogrenci adi : ${allStudent[position].name}"),
                Text("Ogrenci soyadi : ${allStudent[position].surname}"),
                Text("Ogrenci cinsyet : ${allStudent[position].cinsiyet}"),
                Text("Ogrenci numarasi : ${allStudent[position].number}"),

              ],
            )),
            actions: <Widget>[
              //Alert icerisine birden fazla button olucaksa ozel widget bulunmaktadir
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Icon(Icons.add_a_photo),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Raised Button"),
                  ),
                ],
              )
            ],
          );
        });
  }
}

class Ogrenci {
  String name;
  String surname;
  int number;
  bool cinsiyet;

  Ogrenci(this.cinsiyet, this.name, this.number, this.surname);

  @override
  String toString() {
    return "Secilen ogrenci adi : $name  Soyadi : $surname numarasi : $number cinsiyeti : $cinsiyet";
  }
}
