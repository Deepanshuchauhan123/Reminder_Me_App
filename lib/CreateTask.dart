import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Homepage.dart';
import 'package:to_do_app/Root_Page.dart';
import 'Task.dart';

class CreateTask extends StatefulWidget {
  get taskshow => null;

  @override
  CreateTaskState createState() => CreateTaskState();
}

HomePage home = new HomePage();

class CreateTaskState extends State<CreateTask> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;
  DateTime _dateTime;
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  var dateandtime;

  @override
  void dispose() {
    titlecontroller.dispose();
    super.dispose();
  }

  Task t1 = new Task();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0.01),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/task.jpg',
                height: 200,
                width: double.maxFinite,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
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
                                controller: titlecontroller,
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
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
                            child: FlatButton(
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: _dateTime == null
                                            ? DateTime.now()
                                            : _dateTime,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2025))
                                    .then(
                                  (date) {
                                    setState(
                                      () {
                                        _dateTime = date;
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 45,
                                width: double.maxFinite,
                                padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  _dateTime == null
                                      ? "Pick a Date"
                                      : _dateTime.toString().substring(0, 10),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
                            child: FlatButton(
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: _time,
                                ).then(
                                  (time) {
                                    setState(
                                      () {
                                        picked = time;
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 45,
                                width: double.maxFinite,
                                padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  picked == null
                                      ? "Task Start Time"
                                      : picked.format(context).toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
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
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: descController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FlatButton(
                          onPressed: () {
                            print("Tapped bro");

                            setState(
                              () {
                                if ((titlecontroller.text) == "") {
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Please enter Title",
                                      ),
                                    ),
                                  );
                                } else {
                                  if (_dateTime == null) {
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please enter Date",
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (picked == null) {
                                      _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Please enter Time",
                                          ),
                                        ),
                                      );
                                    } else if (descController.text == "") {
                                      _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Please enter Description Of the Task",
                                          ),
                                        ),
                                      );
                                    } else {
                                      dateandtime = _dateTime
                                              .toString()
                                              .substring(0, 10) +
                                          ' ' +
                                          picked.toString().substring(10, 15) +
                                          ":00";

                                      dateandtime = DateTime.parse(dateandtime);
                                      Firestore.instance
                                          .collection("Details")
                                          .document(RootPageState.user)
                                          .collection("Tasks")
                                          .document()
                                          .setData(
                                        {
                                          "Title": titlecontroller.text,
                                          "Date-Time": dateandtime
                                              .millisecondsSinceEpoch,
                                          "Description": descController.text,
                                        },
                                      );
                                      
                                      Navigator.pop(context);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => HomePage(),
                                      //   ),
                                      // );
                                    }
                                  }
                                }
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Add Task",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

