import 'package:flutter/material.dart';
import 'dart:math' as matematik;

class customScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black87,
          //appBar olayi
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Sliver AppBar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            background: Image.asset(
              "assets/images/c5.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              sabitListElemanlari(),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(_dinamikFonsksiyon,
                  childCount: 10)),
        ),
        //digerList lerden farki eleman yuksekligi kendimiz vermekteyiz.
        SliverFixedExtentList(
            delegate: SliverChildListDelegate(sabitListElemanlari()),
            itemExtent: 200),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(_dinamikFonsksiyon, childCount: 50),
          itemExtent: 50,
        ),
//        SliverGrid()
      ],
    );
  }

  List<Widget> sabitListElemanlari() {
    return [
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
      Container(
        height: 150,
        color: _rastgeleRenkCreate(),
        child: Text(
          "Sabit liste elemani 1",
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
    ];
  }

  Widget _dinamikFonsksiyon(BuildContext context, int index) {
    return Container(
      height: 150,
      color: _rastgeleRenkCreate(),
      child: Text(
        "dinamik liste elemani $index",
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
    );
  }

  Color _rastgeleRenkCreate() {
    return Color.fromARGB(
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
    );
  }
}
