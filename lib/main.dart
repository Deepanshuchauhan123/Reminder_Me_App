import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.fill,
              )),
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
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
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black,
                          ))),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black,
                          ))),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, .6),
                      ]),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "New User?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    child: Text('Login Here',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontSize: 18,
                    ),),
                    onTap: (){

                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
