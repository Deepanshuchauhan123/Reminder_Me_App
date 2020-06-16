import 'package:flutter/material.dart';
import 'main.dart';
import 'auth.dart';
import 'Homepage.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
final Baseauth auth;

  @override
  State<StatefulWidget> createState() => new RootPageState();
}
enum AuthStatus{
  notSignedIn,
  signedIn

}

class RootPageState extends State<RootPage> {
  AuthStatus authStatus=AuthStatus.notSignedIn;
  static String user;

  @override
  void initState() {
    
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn: AuthStatus.signedIn;
        user=userId;
      });
    });
  }
static String users_id(){
  return user;
}
void _signedIn(){
  setState(() {
    authStatus= AuthStatus.signedIn;
  });
}
void _signedOut(){
  setState(() {
    authStatus= AuthStatus.notSignedIn;
  });
}
  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn :
      return new LoginPage(auth: widget.auth, onSignedIn: _signedIn,);
      case AuthStatus.signedIn:
      return new HomePage(
        auth: widget.auth,
        onSignedOut: _signedOut,
      );
    } 
  }
}
