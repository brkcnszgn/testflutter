import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class StepperForFlutter extends StatefulWidget {
  @override
  _StepperForFlutterState createState() => _StepperForFlutterState();
}

class _StepperForFlutterState extends State<StepperForFlutter> {
  int _activeStep = 0;
  String name, mail, password;
  List<Step> allSteps;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  var key3 = GlobalKey<FormFieldState>();
  bool hata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allSteps = _allSteps();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: onStepContinue,
                  color: Colors.green,
                  child: const Text("Devamm"),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: onStepCancel,
                  child: Text("Geri gel"),
                  color: Colors.red,
                ),
              ],
            );
          },
          steps: allSteps,
          //TODO steplerin indexi
          currentStep: _activeStep,
          //TODO aktif olan step
//          onStepTapped: (clickForStep) {
//            setState(() {
//              _activeStep = clickForStep;
//            });
//          },
          onStepContinue: () {
            //containue de son elemana dikkat etmek gerekir
            setState(() {
              _continueValidation();

//              if (_activeStep < allSteps.length - 1) {
//                _activeStep++;
//              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_activeStep > 0) {
                _activeStep--;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> steps = [
      Step(
        title: Text("Kullanici Adi Giriniz"),
        subtitle: Text("Username Alt Baslik"),
        state: _stepStateAuto(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
              labelText: "UsernameLabel",
              hintText: "Username Hint",
              border: OutlineInputBorder()),
          validator: (getValue) {
            if (getValue.length < 6) {
              return "En az 6 karakter girmelisiniz";
            }
            return null;
          },
          onSaved: (getValue) {
            name = getValue;
          },
        ),
      ),
      Step(
        title: Text("Parola Giriniz"),
        subtitle: Text("Parola Alt Baslik"),
        state: _stepStateAuto(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
              labelText: "ParoLabel",
              hintText: "Parola Hint",
              border: OutlineInputBorder()),
          validator: (getValue) {
            if (getValue.length < 6) {
              return "En az 6 karakter girmelisiniz";
            }
            return null;
          },
          onSaved: (getValue) {
            password = getValue;
          },
        ),
      ),
      Step(
        title: Text("Mail Giriniz"),
        subtitle: Text("Mail Alt Baslik"),
        state: _stepStateAuto(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "MailLabel",
              hintText: "Mail Hint",
              border: OutlineInputBorder()),
          validator: _emailControl,
          onSaved: (getValue) {
            mail = getValue;
          },
        ),
      ),
    ];
    return steps;
  }

  StepState _stepStateAuto(int i) {
    if (_activeStep == i) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void _continueValidation() {
    switch (_activeStep) {
      case 0:
        if (key0.currentState.validate()) {
          key0.currentState.save();
          hata = false;
          _activeStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState.validate()) {
          key1.currentState.save();
          hata = false;
          _activeStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState.validate()) {
          key2.currentState.save();
          hata = false;
          _activeStep = 2;
          _showDialog(context);
         // _completedAlertDialog(context);
        } else {
          hata = true;
        }
        break;
    }
  }

  String _emailControl(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Gecersiz mail adresi';
    else
      return null;
  }

  void _completedAlertDialog(BuildContext context) {
   showDialog(context: context,
      barrierDismissible: true,
      builder: (context)=>
         Center(
           child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text("Uyari",style: TextStyle(color: Colors.blue),),
                SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Center(child: Text("Kayit Tamamlandi."))
                    ],
                  ),
                ),
              ],
            ),),
         ),
      );
  }
  void _showDialog(BuildContext context) {
    slideDialog.showSlideDialog(
      transitionDuration: Duration(seconds: 1),
      context: context,
      child: Text("Kayit Tamamlandi.",style: TextStyle(color: Colors.white,fontStyle: FontStyle.normal),),
      barrierColor: Colors.white.withOpacity(0.7),
      pillColor: Colors.white,
      backgroundColor: Colors.red,
    );
  }
}
