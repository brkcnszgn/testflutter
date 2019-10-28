import 'package:flutter/material.dart';

class FormIslemleri extends StatefulWidget {
  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  String girilenMetin = "";
  FocusNode _focusNode;
  int maxLines = 1;
  TextEditingController _textEditingController;

                                          //TODO uygulama build'den once calisan method
  @override
  void initState() {
    super.initState();

                                           //TODO Init state icerisinde canli degisiklikler guncel hemen olmasini istedigimiz degisiklikler icin listener kullanmaliyiz
                                           //TODO Sadece setState olayimizi cozmeyecektir. setState form yuklendiginde sadece 1 kere en once tetiklenen methoddur.
                                            //TODO Bu yuzden listener icerisinde setState kullanilir ve kosul belirtilirse form icerisinde soz konusu kosul devamli calisacaktir.

    _focusNode = FocusNode();
    _textEditingController = TextEditingController(text:"varsayilan");
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLines = 3;
        } else {
          maxLines = 1;
        }
      });
    });
  }

                                                //TODO uygulama cop oldugunda tetiklenen method
                                                //TODO Init State'de superden sonra tetiklenir. Dispose de superden once. Yani uygulama kapatilmadan ilgili ozellikler uygulamaya devredilir.
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form islemleri"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[


          FloatingActionButton(
            child: Icon(Icons.add),
            mini: true,
            backgroundColor: Colors.pink,
            onPressed: (){},
          ),


        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                                                   //TODO editText icerisine girilmesi gereken zorunlu karakterler
              keyboardType: TextInputType.number,
                                                    //TODO klavye'ye onay buttonu eklenir
              textInputAction: TextInputAction.done,
                                                    //TODO oto focus
              autofocus: false,
              focusNode: _focusNode,
                                                   //TODO toplam 3 satir veriyor
              maxLines: maxLines,
              controller: _textEditingController,
                                                    //TODO maximum karakter uzunlugu
              maxLength: 20,
              maxLengthEnforced: true,
                                                   //TODO textfiled icersinde on change methodu tetiklendi zaman calisacak
              onChanged: (String s) {
                girilenMetin = s;
                debugPrint("on change ozelligi tetiklendi =>  $s");
              },
              onSubmitted: (String s) {
                girilenMetin = s;
                debugPrint("on Submit ozelligi tetiklendi =>  $s");
              },
              cursorColor: Colors.orange,
                                                     //TODO EditText ile ilgili tum dekorasyonlar burada bulunur
              decoration: InputDecoration(
                hintText: "EditTextHint",
                labelText: "LabelBaslik",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gapPadding: 4),
                                                     //TODO editText disina icon koyar
                icon: Icon(Icons.done),
                                                   //TODO edittext icine en basa icon koyar
                prefixIcon: Icon(Icons.wb_incandescent),
                                                       //TODO editText sonuna icon koyar mesela password'u yildizdan normal degerlere cevirme gibi
                suffixIcon: Icon(Icons.add),
                                                    //TODO edittext Arka plan rengini degistirmek icin
//                fillColor: Colors.black,
//                filled: true
              ),
            ),
          ),
          Container(
            color: Colors.deepOrangeAccent,
            margin: EdgeInsets.all(10),
                                                          //TODO olabldiignce container buyutmek icin width: double.infinity kullanilabilir. height : MediaQuery.of(context).size.height ile ekranin verilerini ekran oranlarina gore yayilacak
            height: 100,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                girilenMetin,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
