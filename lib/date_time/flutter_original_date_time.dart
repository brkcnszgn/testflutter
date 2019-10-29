import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class OriginalDateTimeFlutter extends StatefulWidget {
  @override
  _OriginalDateTimeFlutterState createState() =>
      _OriginalDateTimeFlutterState();
}

class _OriginalDateTimeFlutterState extends State<OriginalDateTimeFlutter> {

  static DateTime nows = DateTime.now();
  DateTime before3Month = DateTime(2019,nows.month-3);
  DateTime after20day = DateTime(2020,1,1);

 static final Gregorian g1 = Gregorian(2013, 1, 10);
  static final Jalali j1 = g1.toJalali();

  TimeOfDay nowClock = TimeOfDay.now();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date time Ekrani"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {



              //TODO tarih secme araligi
              showDatePicker(context: context, initialDate: nows, firstDate: before3Month, lastDate: after20day)
                 .then((selectedTime){
                 debugPrint(selectedTime.toString());
                 debugPrint(selectedTime.millisecondsSinceEpoch.toString());
                 debugPrint(selectedTime.toIso8601String());

                 var newDate = DateTime.parse(selectedTime.toUtc().toIso8601String());
                 debugPrint(newDate.toIso8601String());

                  final dateTime = DateTime.now();
                 debugPrint('now is $dateTime');
                 print('now is ${Gregorian.fromDateTime(dateTime)} in Gregorian');
                 print('now is ${Jalali.fromDateTime(dateTime)} in Jalali');
              });




            },
            child: Text("Tarih Sec"),
            color: Colors.green,
          ),
        RaisedButton(
            onPressed: () {
              showTimePicker(context: context, initialTime: nowClock).then((selectedTime){
                debugPrint(selectedTime.hour.toString());

              });
            },
            child: Text("Saat Sec"),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}


