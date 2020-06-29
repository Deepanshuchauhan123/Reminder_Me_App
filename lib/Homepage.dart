import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/CreateTask.dart';
import 'package:to_do_app/Get_Tasks.dart';
import 'package:to_do_app/Root_Page.dart';
import 'auth.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
  HomePage({this.auth, this.onSignedOut});
  final Baseauth auth;

  final VoidCallback onSignedOut;
  void signOuts() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  // void methodcall(){
  //   HomePageState h1 =new HomePageState();
  //     h1.setDataScreen();
  // }
}

String name = "Your Name";
var username = "Your Name";

Future<String> getUserName() async {
  await Firestore.instance
      .collection("Details")
      .document(RootPageState.user)
      .get()
      .then(
    (onValue) async {
      username = onValue.data["Name"];

      // print(
      //     "Value of the name is   ${onValue.data["Name"]}        and id  ${RootPageState.user}");
    },
  );
  return username;
}

class HomePageState extends State<HomePage> {
  RootPage r1 = new RootPage();
  Get_Tasks g1 = new Get_Tasks();
  QuerySnapshot task;

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customcontroller = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Your Name"),
          content: TextFormField(
            controller: customcontroller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text("Done"),
              onPressed: () {
                Navigator.of(context).pop(
                  customcontroller.text.toString(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // @override
  // void initState() {
  //   super.initState();

  //   getUserName().then(
  //     (onValue) {
  //       setState(
  //         () {
  //           username = onValue;

  //           print("Set State   $username");
  //         },
  //       );
  //     },
  //   );
  // }
  @override
  void initState() {
    setDataScreen();
    super.initState();
  }

  setDataScreen() {
    g1.getData().then(
      (onvalue) {
        task = onvalue;
      },
    );
  }

  @override
  void didUpdateWidget(HomePageState) {
    super.didUpdateWidget(HomePageState);
    getUserName().then(
      (onValue) {
        setState(
          () {
            username = onValue;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setDataScreen();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              'Logout',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'OldStandardTT'),
            ),
            onPressed: widget.signOuts,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              width: double.maxFinite,
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
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/person.png',
                              ),
                              radius: 50,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: FlatButton(
                              onPressed: () {
                                createAlertDialog(context).then(
                                  (onValue) {
                                    name = onValue;
                                    setState(
                                      () {
                                        if (name != null && name != "") {
                                          Firestore.instance
                                              .collection('Details')
                                              .document(RootPageState.user)
                                              .updateData({"Name": name});

                                          getUserName().then(
                                            (onValue) {
                                              setState(
                                                () {
                                                  username = onValue;
                                                },
                                              );
                                            },
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text(
                                username,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'OldStandardTT',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
                      fontSize: 25,
                      fontFamily: 'OldStandardTT',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.blueAccent,
                      child: InkWell(
                        splashColor: Colors.white,
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(143, 148, 251, .18),
                      Color.fromRGBO(143, 148, 251, .01),
                    ],
                  ),
                ),
                child: _taskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskList() {
    if (task != null) {
      return ListView.builder(
        itemCount: task.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          return Card(
            shadowColor: Colors.blue,
            borderOnForeground: true,
            elevation: 2.0,
            child: Container(
              decoration: new BoxDecoration(
                border: new Border(
                  left: new BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 5.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/images.png"),
                  radius: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 26.0,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Task Deletation",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OldStandardTT',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              content: Text(
                                "Do you really want to Delete this task ?",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  color: Colors.blue,
                                  elevation: 5.0,
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Firestore.instance
                                        .collection("Details")
                                        .document(RootPageState.user)
                                        .collection("Tasks")
                                        .document(task.documents[i].documentID)
                                        .delete();

                                    Navigator.pop(context);
                                  },
                                ),
                                MaterialButton(
                                  color: Colors.blue,
                                  elevation: 5.0,
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                
                title: Text(
                  task.documents[i].data["Title"],
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'OldStandardTT'),
                ),

                subtitle: Column(
                  children: <Widget>[
                    Text(
                  task.documents[i].data['Description'],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  task.documents[i].data['Date-Time'].toString(),
                )
                  ],
                )
                
              ),
            ),
          );
        },
      );
    } else {
      return Image.asset("assets/images/empty_List.jpg");
    }
  }
}
