import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Resim ve button Turleri",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(4),
                  color: Colors.redAccent,
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: Image.asset(
                          "assets/images/bh2.jpg",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text("Asset Image"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(4),
                  color: Colors.redAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                        elevation: 4,
                        child: Image.network(
                          "https://images.pexels.com/photos/1212487/pexels-photo-1212487.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                        ),
                      ),
                      Container(
                        child: Text("NetWork Image"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(4),
                  color: Colors.blue,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 38),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg",
                          ),
                          radius: 60,
                        ),
                      ),
                      //bir image kullanilacaksa child kullanma ancak arka plan renk ustu yaziysa child kullan
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: Text("Circle Avatar"),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
       IntrinsicHeight(
         child:  Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[
             Expanded(
               child: Container(

                 margin: EdgeInsets.all(4),
                 color: Colors.redAccent,
                 child: Column(
                   children: <Widget>[
                     Card(
                       child: FadeInImage.assetNetwork(
                         placeholder: "assets/images/loading.gif",
                         image:
                         "https://wallpapercave.com/wp/wp2670841.jpg",
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.all(5),
                       child: Text("Fade in Image"),
                     ),
                   ],
                 ),
               ),
             ),
             Expanded(
               child: Container(
                 margin: EdgeInsets.all(4),
                 color: Colors.redAccent,
                 child: Column(
                   children: <Widget>[
                     Card(
                       margin: EdgeInsets.only(top: 25),
                       child: FlutterLogo(
                         size: 60,colors: Colors.deepOrange,
                         style: FlutterLogoStyle.stacked,
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: 25),

                       child: Text("Fade in Image",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
                     ),
                   ],
                 ),
               ),
             ),
             Expanded(
               child: Container(
                 margin: EdgeInsets.all(4),
                 color: Colors.redAccent,
                 child: Column(
                   children: <Widget>[
                   Expanded(
                     child : Card(
                       margin: EdgeInsets.only(top: 25),
                       child: Placeholder(
                         color: Colors.pink, strokeWidth: 4.0,
                       ),
                     ),
                   ),
                     Container(
                       margin: EdgeInsets.only(top: 25),

                       child: Text("Fade in Image",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
                     ),
                   ],
                 ),
               ),
             ),
           ],
         ),
       )

      ],
    );
  }
}
