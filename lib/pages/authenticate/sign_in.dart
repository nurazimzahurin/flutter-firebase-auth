import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/pages/authenticate/register.dart';
import 'package:flutter_firebase_auth/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Sign in'),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
              icon: Icon(Icons.person),
              label: Text('Sign Up'))
        ],
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Form(
            key: _formKey,
              child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.blueAccent,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width:1)
                  )
                ),
                validator: (val) => val.isEmpty ? 'Email is required' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.blueAccent,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width:1)
                  )
                ),
                validator: (val) => val.length < 6 ? 'password must be more than 6 character' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signIn(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Invalid credentials';
                      });
                    }
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue[900],
              ),
              SizedBox(height:12),
              Text(error, style: TextStyle(color: Colors.red, fontSize:14)),
            ],
          )),
        ),
      ),
    );
  }
}
