import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
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
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    // margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    decoration: BoxDecoration(
                      //color: Colors.white70,
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
            ],
          ),
        ),
      ),
    );
  }
}
