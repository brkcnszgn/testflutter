import 'package:flutter/material.dart';

class GridViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 100,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position) {
          //istenilen widget eklenir
          //List olarak eklenen Container icersinde tasarim kaliplari
          //Shadowlar, shape, border,radius ozelliklerini elle yada tumuyle kullanilabilecek tum hersey.
          return GestureDetector(
            child: Container(
              alignment: Alignment.center,

              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  //Istenilen noktaya sarmalama belirtec ekleme
//                border: Border(
//                  top: BorderSide(
//                    color: Colors.deepOrange,
//                    width: 5,
//                    style: BorderStyle.solid,
//                  ),
//                  //alt cizgisi
//                  bottom: BorderSide(color: Colors.blue, width: 5),
//                ),
//                borderRadius: BorderRadius.all(
//                  Radius.circular(20),
//                ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      offset: Offset(5.0, 15.0),
                      blurRadius: 20.0,
                    )
                  ],
                  shape: BoxShape.circle,
                  //kutu etrafini istenilen renk ile sarmalama
                  border: Border.all(
                      width: 5,
                      color: Colors.orangeAccent,
                      style: BorderStyle.solid),
                  color: Colors.red[100 * ((position + 1) % 8)],
                  //boxDecoration icersinde verilen renk degeri varsa daha once verilmis renkler pasif hale donusur
                  gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.red],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/c1.jpg",
                      ),
                      fit: BoxFit.cover)),
              //[renkten sonra yazilan gelen renkin moduna gore renklendirir]
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  "merhaba Flutter $position",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            onTap: () => debugPrint("Listedeki eleman $position tiklanildi"),
            onDoubleTap: () => debugPrint("Listedeki eleman $position cift tiklanildi"),
            onLongPress: () => debugPrint("Listedeki eleman $position uzun tiklanildi"),
         onHorizontalDragStart: (e) => debugPrint("Listedeki eleman $position uzun tiklanildi $e"),
          );
        });
  }
}

/*
* Etkin calismasini istedigimiz sistem icin girdview.builder kullanilr.void
* Genelde kullanim GridView.count dur.
* gesture detector onTap ozelligi olmayan tum widgetlara linkleme (click islemleri icin kullanilir)
* Kullanilmak istenen widget alanlarinin disina onTap, onLongPress, onDoubleTap vb. Click olaylarina hakim olunabilir.
*
* */

Widget get _gridCount {
  return GridView.count(
    crossAxisCount: 3,
    primary: true,
    // gridviewin countuna gore kayma ozelligi acilir kapanir. anamisyonu icin gecerli
    padding: EdgeInsets.all(5),
    crossAxisSpacing: 10,
    reverse: true,
    // gelen veriyi tersten duze dogru goturur.
    mainAxisSpacing: 10,
    scrollDirection: Axis.vertical,
    //manuel olarak elemanlarin yatay yada dikey kayma ozelligi aktif edilebilir.
    children: <Widget>[
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter1",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter2",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter3",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter4",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter5",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter6",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

Widget get _gridExtent {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    // MaxCrossAxisExcent Her bir elemani verdigimiz degere gore ekran boyutunu baz alarak sigdirir.
    primary: true,
    // gridviewin countuna gore kayma ozelligi acilir kapanir. anamisyonu icin gecerli
    padding: EdgeInsets.all(5),
    crossAxisSpacing: 10,
    // reverse: true, // gelen veriyi tersten duze dogru goturur.
    mainAxisSpacing: 10,
    scrollDirection: Axis.vertical,
    //manuel olarak elemanlarin yatay yada dikey kayma ozelligi aktif edilebilir.
    children: <Widget>[
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter1",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter2",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter3",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter4",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter5",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter6",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        alignment: Alignment.center, //container i ortalar
        color: Colors.deepOrange.shade200,
        child: Text(
          "Merhaba flutter",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
