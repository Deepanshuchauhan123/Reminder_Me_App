import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// ...

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0.01),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/addtask.gif',
                height: 250,
                width: double.maxFinite,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[200],
                        blurRadius: 15.0,
                        offset: Offset(
                          0,
                          10,
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),






              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[200],
                        blurRadius: 15.0,
                        offset: Offset(
                          0,
                          10,
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 45,
                    width: double.maxFinite,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 8, 40, 0),
                    child: Text(
                    _dateTime == null ? "Pick a Date" : _dateTime.toString(),
                    style: TextStyle(color: Colors.black,fontSize: 17,),
                  ),
                    
                  ),
                ),
              ),






              Column(
                children: <Widget>[
                  Text(
                    _dateTime == null ? "Pick a Date" : _dateTime.toString(),
                  ),
                  RaisedButton(
                    child: Text("Date"),
                    onPressed: (){
                      showDatePicker(
                        context: context,
                        initialDate: _dateTime == null ? DateTime.now():
                        _dateTime,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025)
                      ).then((date){
                        setState(() {
                          _dateTime=date;
                        });
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
