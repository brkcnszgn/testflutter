import 'package:flutter/material.dart';

class FormTextField_ extends StatefulWidget {
  @override
  _FormTextField_State createState() => _FormTextField_State();
}

class _FormTextField_State extends State<FormTextField_> {
  String _nameSurname;
  String _password;
  String _email;
 static RegExp nameRegExp = RegExp('[a-zA-Z]');
  bool automaticControl = false;

 final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.pinkAccent,
          errorColor: Colors.blue,
          accentColor: Colors.green,
          hintColor: Colors.pink),

      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.save),
        ),
        appBar: AppBar(
          title: Text("Form ve TextFormField"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            //TODO /***********************************/////////////////////////// global key projenin heryerinde bu isimle kontrol edilecebilecek
            key: formKey,
            //TODO /***********************************/////////////////////////// otomatik validate
            autovalidate: automaticControl,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Name and Surname",
                    labelText: "Name and Surname",
                    border: OutlineInputBorder(),
                  ),
                  //initialValue: "burak",
                  //TODO /***********************************///////////////////////////
                  validator:   (name) => name.isEmpty
                      ? 'Enter Your Name'
                      : (nameRegExp.hasMatch(name)
                      ? null
                      : 'Enter a Valid Name'),
                  onSaved: (value)=> _nameSurname = value,
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  validator: _emailControl,
                  onSaved: (value)=> _email = value,
                ),
                SizedBox(
                  height: 5,
                ),
                //TODO /***********************************///////////////////////////
                TextFormField(
                  keyboardType: TextInputType.text,
                  //password gizleme
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.stars,
                      color: Colors.pink,
                    ),
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  //TODO /***********************************///////////////////////////
                  //form validasyonlari
                  validator: (String getString) {

                    if(getString.length <6){
                      return "Lutfen gecerli bir parola giriniz";
                    }else
                    return null;

                  },
                  onSaved: (value)=> _password = value,
                ),
                RaisedButton.icon(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    _registerForUser();
                  },
                  label: Text("Kaydet"),
                  color: Colors.cyanAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerForUser() {
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      debugPrint("Girilen name and surname : $_nameSurname");
      debugPrint("Girilen email adresi : $_email");
      debugPrint("Girilen password : $_password");

    }else{
      setState(() {
        automaticControl = true;
      });
    }
  }
}


  String _emailControl(String mail){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Gecersiz mail adresi';
    else
      return null;
  }

