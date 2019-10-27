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
      body: Center(
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
          ],
        ),
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
