import 'package:flutter/material.dart';
import 'package:testflutter/customScrollView/customScrollView.dart';
import 'package:testflutter/listview/listview_sperator_builder.dart';

import 'ListView_kullanici_dostu.dart';
import 'girdView/grid_view.dart';
import 'listView.dart';
import 'navigator_push/navigator_push.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Flutter Dersleri Devam ListView",
      routes: {

      //  "/" : (context)=> NavigatorPush(), //ilk acilacak sayfayi simgeler. //splash ekran vb icin kullanilabilir.
        '/Cpage' :(context)=> CPage(),
        '/Bpage':(context)=> BPage("MainDartTan Geldi")
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: NavigatorPush(),
    ),
  );
}
