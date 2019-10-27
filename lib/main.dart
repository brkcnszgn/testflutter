import 'package:flutter/material.dart';
import 'package:testflutter/customScrollView/customScrollView.dart';
import 'package:testflutter/listview/listview_sperator_builder.dart';

import 'ListView_kullanici_dostu.dart';
import 'girdView/grid_view.dart';
import 'listView.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Dersleri Devam ListView",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.deepOrange
    ),
    home: Scaffold(
//      appBar: AppBar(
//        title: Text("Flutter Dersleri Devam ListView"),
//      ),
      body: customScrollView(),
    ),
  ));
}
