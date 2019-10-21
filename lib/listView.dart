import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  //Lister icin kaynak olusturma
  List<int> listeNumeric = List.generate(
      300,
      /*liste elemens sayisi*/ (index) =>
          index /*olusturulan listein indexini pozisyonuna gore ata*/);
  List<String> listeTitle =
      List.generate(300, (index) => "Liste elemani alt baslik $index");

  //widget icinde listview elemanlarini set etmek icin map yapisi kullanilir.
  @override
  Widget build(BuildContext context) {
    return ListView(
      //basit liste ornegi
      children: listeNumeric
      //olusturulan integer listi children olarak atanip map ile liste pozition olarak atanir,
      //bundan sonraki liste icerisinde kullanilacak olan her nesne map icindeki
      //listPozition olarak atanacaktir.
      //ornegin listTitle[listPozition] listenin pozisyonuna ata
          .map(
            (listPozition) =>  Column(
              children: <Widget>[
                Container(
                  //genel card view tasarimi
                  child: Card(
                    color: Colors.teal.shade100,
                    margin: EdgeInsets.all(5),
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.accessible_forward),
                        radius: 12,
                      ),
                      title: Text("Liste eleman baslik $listPozition"),
                      subtitle: Text(listeTitle[listPozition]),
                      trailing: Icon(Icons.accessibility),
                    ),
                  ),
                ),
                Divider(
                  //android bulunan View ile esdegerdir.
                  color: Colors.black87, height: 10, indent: 10, endIndent: 10,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}


