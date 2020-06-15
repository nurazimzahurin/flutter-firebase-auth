import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/profile.dart';
import 'package:flutter_firebase_auth/pages/profile_list.dart';
import 'package:flutter_firebase_auth/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_auth/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Profile>>.value(
      value: DatabaseService().profiles,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Sign Out')),
          ],
        ),
        backgroundColor: Colors.blue,
        body: ProfileList(),
      ),
    );
  }
}
