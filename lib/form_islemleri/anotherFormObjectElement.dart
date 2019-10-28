import 'package:flutter/material.dart';

class AnotherFormObjectElement extends StatefulWidget {
  @override
  _AnotherFormObjectElementState createState() =>
      _AnotherFormObjectElementState();
}

class _AnotherFormObjectElementState extends State<AnotherFormObjectElement> {
  bool checkBoxValue = false;
  String city = "Ankara";
  bool swithState = false;
  double sliderValue = 0;

  //TODO String degerler olusturan basit il map'i

  List<String> selectedCity = ["Ankara", "Bursa", "Gaziantep"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text("Diger form Elemanlari"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            CheckboxListTile(
              value: checkBoxValue,
              onChanged: (selectCheckBox) {
                setState(() {
                  checkBoxValue = selectCheckBox;
                });
              },
              activeColor: Colors.orange,
              title: Text("CheckBox Title"),
              subtitle: Text("CheckBox Sub Title"),
              secondary: Icon(Icons.add_a_photo),
              selected: false,
            ),
            RadioListTile<String>(
              value: "istanbul",
              groupValue: city,
              title: Text("istanbul"),
              onChanged: (value) {
                debugPrint("Selected value : $value");
                setState(() {
                  city = value;
                });
              },
            ),
            RadioListTile<String>(
              value: "izmir",
              groupValue: city,
              title: Text("Izmir"),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
                debugPrint("Selected value : $value");
              },
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: city,
              title: Text("ankara"),
              subtitle: Text("Sub Title"),
              secondary: Icon(Icons.zoom_out_map),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
                debugPrint("Selected value : $value");
              },
            ),
            SwitchListTile(
                value: swithState,
                title: Text("Switch Title"),
                subtitle: Text("SwitchSubTitle"),
                selected: false,
                onChanged: (value) {
                  setState(() {
                    swithState = value;
                    debugPrint("Switchden gelen value : $swithState");
                  });
                }),
            Text("Degeri slider'dan seciniz ${sliderValue.toInt()}"),
            Slider(
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                  sliderValue.toInt();
                  debugPrint("Slider yeni degeri = ${sliderValue.toInt()}");
                });
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: sliderValue.toInt().toString(),
            ),
//            DropdownButton<String>(
//              items: [
//                DropdownMenuItem<String>(
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        height: 16,
//                        width: 16,
//                        color: Colors.deepOrange,
//                        margin: EdgeInsets.only(right: 5, left: 5),
//                      ),
//                      Container(
//                        child: Icon(
//                          Icons.map,
//                          color: Colors.red,
//                        ),
//                        margin: EdgeInsets.only(right: 5),
//                      ),
//                      Text("Izmir"),
//                    ],
//                  ),
//                  value: "izmir",
//                ),
//                DropdownMenuItem<String>(
//                  child: Text("Isntabul"),
//                  value: "istanbul",
//                ),
//                DropdownMenuItem<String>(
//                  child: Text("Ankara"),
//                  value: "ankara",
//                ),
//                DropdownMenuItem<String>(
//                  child: Text("Antalya"),
//                  value: "antalya",
//                ),
//                DropdownMenuItem<String>(
//                  child: Text("Sakarya"),
//                  value: "sakarya",
//                ),
//              ],
//              onChanged: (String selected) {
//                setState(() {
//                  city = selected;
//                  debugPrint("Secilen dropdown nesnesi = $city");
//                });
//              },
//              hint: Container(
//                child: Center(child: Text("Seciniz")),
//                margin: EdgeInsets.only(left: 35),
//              ),
//              value: city,
//            ),
          Container(
            child: DropdownButton(items: selectedCity.map((index){
              return DropdownMenuItem<String>(child: Text(index.toString()), value: index.toString(),
              );
            }).toList(),
              hint: Text("Seciniz"),
              isDense: true,
              onChanged: (String s){
              setState(() {
                city = s.toString();
              });
            },

            value: city,
          ),
          ),
          ],
        ),
      ),
    );
  }
}
