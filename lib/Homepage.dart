import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:to_do_app/CreateTask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.blueAccent,
                      child: InkWell(
                        splashColor: Colors.purple,
                        child: SizedBox(
                          width: 62,
                          height: 62,
                          child: Icon(
                            Icons.add,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateTask(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 400,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
