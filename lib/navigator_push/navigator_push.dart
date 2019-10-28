import 'package:flutter/material.dart';


class NavigatorPush extends StatelessWidget {
  String baslik = "B sayfasindan gelen String deger";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sayfalar arasi gecis",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                //istenilen sayfaya gitmeye yarar gidilen sayfa da stack yapisi olusur ve appBar icinde otomatik geri butonu olusturur
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => APage(),
                  ),
                );
              },
              child: Text(
                "A sayfasina git",
                style: TextStyle(color: Colors.black87),
              ),
              color: Colors.yellow,
            ),
            RaisedButton(
              onPressed: () {
                //istenilen sayfaya gitmeye yarar gidilen sayfa da stack yapisi olusur ve appBar icinde otomatik geri butonu olusturur
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BPage(baslik),
                  ),
                );
              },
              child: Text(
                "B sayfasina git",
                style: TextStyle(color: Colors.black87),
              ),
              color: Colors.yellow,
            ),
            RaisedButton(
              onPressed: () {
                //istenilen sayfaya gitmeye yarar gidilen sayfa da stack yapisi olusur ve appBar icinde otomatik geri butonu olusturur
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CPage(),
                  ),
                );
              },
              child: Text(
                "C sayfasina git ve geri gel",
                style: TextStyle(color: Colors.black87),
              ),
              color: Colors.yellow,
            ),
            RaisedButton(
              onPressed: () {
                //istenilen sayfaya gitmeye yarar gidilen sayfa da stack yapisi olusur ve appBar icinde otomatik geri butonu olusturur
                Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DPage(),
                  ),
                ).then((popOlayindanSonraGelenDeger) {
                  debugPrint(
                      "Pop isleminden gelen deger $popOlayindanSonraGelenDeger");
                });
              },
              child: Text(
                "D sayfasina git ve geri gelirken veri getir",
                style: TextStyle(color: Colors.black87),
              ),
              color: Colors.pink,
            ),
            RaisedButton(
              onPressed: () {
                // Bu navigator ozelligi geri tusuna basildiginda uygulama kapanir.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EPage(),
                  ),
                );
              },
              child: Text(
                "E sayfasina git ve geri geleme",
                style: TextStyle(color: Colors.black87),
              ),
              color: Colors.pink,
            ),
            RaisedButton(
              onPressed: () {
                // Bu navigator ozelligi geri tusuna basildiginda uygulama kapanir.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LisPage(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  "List git ve geri geleme",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              color: Colors.pink,
            ),
          RaisedButton(
              onPressed: () {
                // Bu navigator ozelligi geri tusuna basildiginda uygulama kapanir.
                Navigator.pushNamed(context, "/formInput"

                );
              },
              child: Center(
                child: Text(
                  "Input Forma git",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              color: Colors.pink,
            ),
           RaisedButton(
              onPressed: () {
                // Bu navigator ozelligi geri tusuna basildiginda uygulama kapanir.
                Navigator.pushNamed(context, "/formTextField"

                );
              },
              child: Center(
                child: Text(
                  "TextField Forma git",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              color: Colors.orange,
            ),
           RaisedButton(
              onPressed: () {
                // Bu navigator ozelligi geri tusuna basildiginda uygulama kapanir.
                Navigator.pushNamed(context, "/anotherFormObjectElement"

                );
              },
              child: Center(
                child: Text(
                  "Diger  Form elemanlarina git",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class ListDetail extends StatelessWidget {

  int clickForPosition = 0;
  ListDetail(this.clickForPosition);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste Detay Sayfasi",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body:
      Container(
        color: Colors.orange,
        height: 250,
        child:  Center(child: Text("Listedeki  $clickForPosition  elemanina tiklandi")),
        margin: EdgeInsets.all(5),
      ),
    );
  }
}

class LisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste Sayfasi",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          //Liste icerisindeki elemanin pozisyonuna gore click alabiliriz
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/listDetail/$position');
              //Normal rota
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ListDetail(position),
//                ),
//              );
            },
            child: Container(
              color: Colors.orange,
              child: Center(child: Text("Liste elemani $position")),
              height: 100,
              width: 200,
              margin: EdgeInsets.all(5),
            ),
          );
        },
        itemCount: 30,
      ),
    );
  }
}

/*
* Ornegin bir list icerisinden birden fazla urun var ve biz bir silme islemi yapicaz
* bir sonraki sayfaya gectik ve silmekten vazgectik geriye appBard daki geri butonuyla geldik
* navigator.push methodunun .then methodu yine bunu algilicak ve donen deger null olucaktir
* Bunu ortadan kaldirmak icin Widget kullanmak gerekir WillPopScope kullanmak gerekir.
* bu widget icerisinde onwillPop ve child zorunludur
* */
class EPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sayfalar arasi gecis",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "E sayfasina git",
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class DPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "sayfalar arasi gecis",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "D sayfasi ",
                  style: TextStyle(color: Colors.black87),
                ),
                RaisedButton(
                  color: Colors.pink,
                  child: Text("Geri Don ve Veri Gonder"),
                  onPressed: () {
                    Navigator.pop<bool>((context), true);
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {
          debugPrint("OnWillPop Calisti");
          Navigator.pop(context, false);
          return Future.value(false);
        });
  }
}

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sayfalar arasi gecis",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "A sayfasina git",
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class BPage extends StatelessWidget {
  String gelenVeriBaslikVerisi;

  BPage(this.gelenVeriBaslikVerisi) {}

  //ya da
  // BPage(String baslik){this.baslik = gelenVeriBaslikVerisi}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sayfalar arasi gecis",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              gelenVeriBaslikVerisi,
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

//pushNamed
class CPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sayfalar arasi gecis",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "C sayfasina ",
              style: TextStyle(color: Colors.black87),
            ),
            RaisedButton(
              color: Colors.pink,
              child: Text("Geri Don"),
              onPressed: () {
                Navigator.pop((context));
              },
            ),
            RaisedButton(
              color: Colors.pink,
              child: Text("A sayfasina git"),
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => APage()));
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("B sayfasina git"),
              onPressed: () {
//                Navigator.push((context),
//                    MaterialPageRoute(builder: (context) => APage()));
                //isim ile rota olusturma
                Navigator.pushNamed(context, '/Bpage');
                //Navigator.pushReplacementNamed() geldigi sayfayi yok sayar bir oncekine doner javada ki Finish methodu gibi
                //  Navigator.pushReplacementNamed(context, '/Bpage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
