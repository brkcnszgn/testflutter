import 'package:flutter/material.dart';
import 'package:testflutter/customScrollView/customScrollView.dart';
import 'package:testflutter/listview/listview_sperator_builder.dart';

import 'ListView_kullanici_dostu.dart';

import 'form_islemleri/form_text_field.dart';
import 'form_islemleri/input_field.dart';
import 'girdView/grid_view.dart';
import 'listView.dart';
import 'navigator_push/navigator_push.dart';

void main() {
  int clickForPosition;
  runApp(
    MaterialApp(
      title: "Flutter Dersleri Devam ListView",

      //initialRoute istenilen rotalari tek tek kontrol eder ve onlari Stack olarak birbirinin arkasina ekler ve ilk o ekran acilir.

      // initialRoute: "/CPage/DPage/APage",
      routes: {
        //  "/" : (context)=> NavigatorPush(), //ilk acilacak sayfayi simgeler. //splash ekran vb icin kullanilabilir.
        '/Cpage': (context) => CPage(),
        '/Bpage': (context) => BPage("MainDartTan Geldi"),
        '/Cpage/Dpage': (context) => DPage(),
        '/CPage/DPage/APage': (context) => APage(),
        '/listPage': (context) => LisPage(),
        '/formInput': (context)=> TextFieldIslemleri(),
        '/formTextField': (context)=> FormTextField_(),
//        '/listDetail/$clickForPosition':(context)=>ListDetail(clickForPosition),
      },

//      onGenerateRoute: (RouteSettings settings) {
//
//        List<String> pathElemanlari = settings.name.split("/"); //  /detay/index
//        //donen degerleri rotalari kontrol etmemiz gerekir
//        if (pathElemanlari[1] == 'listDetail') {
//
//          return MaterialPageRoute(
//            builder: (context) => ListDetail(
//              int.parse(pathElemanlari[2]),
//            ),
//          );
//          // ignore: missing_return
//        }
//
//        // /urun/detay/id icin rota olusturma
////        if(pathElemanlari[1]== "urun"){
////            if(pathElemanlari[2]=="detay"){
////
////            }else if(pathElemanlari[2]=="ozellik"){
////
////            }
////        }
//      },

      //Hata almaasi durumunda gosterielcek olan ekran.
//      onUnknownRoute: (RouteSettings settigs) => MaterialPageRoute(
//        builder: (context) => NavigatorPush(),
//      ),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: NavigatorPush(),
    ),
  );
}
