import 'package:flutter/material.dart';

import 'listView.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Dersleri Devam ListView",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.deepOrange
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dersleri Devam ListView"),
      ),
      body: ListViews(),
    ),
  ));
}
