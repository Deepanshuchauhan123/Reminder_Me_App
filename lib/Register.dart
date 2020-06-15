import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth.dart';
import 'package:to_do_app/main.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Register extends StatelessWidget {
  ProgressDialog progressDialog;
  BuildContext cont;
  int flag = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _email, _password;
  TextEditingController _pass = TextEditingController();
  final _formkey = new GlobalKey<FormState>();

  Register({this.auth});
  final Baseauth auth;
  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        flag = 1;
        String userid =
            await auth.createUserwithemailandpassword(_email, _password);
        Firestore.instance.collection('Details').add(
          {
            "Name": _name,
            "Email": _email,
          },
        ).then(
          (result) => {
            progressDialog.update(message: "Registered Sucessfully"),
            Future.delayed(
              Duration(seconds: 1),
            ).then(
              (value) {
                Navigator.pop(cont);
                progressDialog.hide();
              },
            ),
          },
        );

        print("Userid: $userid");
      } catch (e) {
        print(e);
        flag = 0;
        progressDialog.update(message: e);
        progressDialog.hide();
      }
    } else {
      progressDialog.update(message: "Invalid Details.");
      Future.delayed(Duration(seconds: 1)).then((value) {
        progressDialog.hide();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);

    cont = context;
    void funct() {
      progressDialog.style(message: "Checking User Details....");
      progressDialog.show();
      validateAndSubmit();
      if (flag == 0) {
        progressDialog.update(message: "Invalid Details Check Again !!!!");
        Future.delayed(Duration(seconds: 1)).then((value) {
          progressDialog.hide();
        });
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 340,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/background.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/light-1.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/light-2.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/clock.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 80),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 15.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: new Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(6, 1, 3, 1),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                validator: (value) => value.isEmpty
                                    ? 'Name can\'t be empty'
                                    : null,
                                onSaved: (value) => _name = value,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(6, 1, 3, 1),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                validator: (value) => value.isEmpty
                                    ? 'Email can\'t be empty'
                                    : null,
                                onSaved: (value) => _email = value.trim(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(6, 1, 3, 1),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                controller: _pass,
                                validator: (value) => value.isEmpty
                                    ? 'Password can\'t be empty'
                                    : null,
                                onSaved: (value) => _password = value.trim(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(6, 1, 3, 1),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  border: InputBorder.none,
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    value = null;
                                    return 'Confirm Password can\'t be empty';
                                  }
                                  if (value != _pass.text) {
                                    return 'Confirm Password should match Password';
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FlatButton(
                      onPressed: funct,
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
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Already Registered?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//implementation 'com.google.firebase:firebase-analytics:17.2.2'
