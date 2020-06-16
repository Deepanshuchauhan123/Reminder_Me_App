import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/CreateTask.dart';
import 'package:to_do_app/Root_Page.dart';
import 'package:to_do_app/main.dart';
import 'auth.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
 HomePage({this.auth,this.onSignedOut});
final Baseauth auth;
final VoidCallback onSignedOut;
 void signOuts() async{
    try{
        await auth.signOut();
        onSignedOut();
    }catch(e){
      print(e);
    }
  }
}

List<Card> taskshow = [];
String name = "Your Name";
List<String> nameyour = [
  "Your Name", 
];



class HomePageState extends State<HomePage> {
 
 RootPage r1=new RootPage();
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
              LengthLimitingTextInputFormatter(15),
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
 

HomePage h1=new HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Logout',style: TextStyle(color: Colors.black,fontSize: 20.0,fontFamily: 'OldStandardTT'),),
            onPressed:widget.signOuts,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
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
                                          Firestore.instance.collection('Details').document().setData({
                                            'Name :': name
                                          });
                                          nameyour.add(name);
                                          print(nameyour);
                                          print("uuuuuuuiiiiiiiiiiiiiiddddddddddd:  ${RootPageState.users_id()} ");
                                          nameyour
                                              .removeAt(nameyour.length - 2);
                                        } else {
                                          
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text(
                                nameyour[nameyour.length - 1],
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
              
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.lightBlueAccent,
                  
                  child: Column(
                    children: <Widget>[
                     Image.asset(taskshow.length==0 ?"assets/images/empty_List.jpg":""),
                      Column(
                        children: taskshow,
                      )
                    ],
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
