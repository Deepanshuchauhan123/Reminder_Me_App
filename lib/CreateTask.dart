import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;
  DateTime _dateTime;
  TextEditingController titlecontroller = new TextEditingController();

  TextEditingController descController = new TextEditingController();

  @override
  void dispose() {
    
    titlecontroller.dispose();
    super.dispose();
  }

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
                            print(titlecontroller.text);
                            print(_dateTime.toString());
                            print(picked);
                            print(descController.text);
                            
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
