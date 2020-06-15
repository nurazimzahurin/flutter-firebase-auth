import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/profile.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;

  ProfileTile({this.profile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 2,
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 12),
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Email :', style: TextStyle(color:Colors.black, fontSize:12),),
              Text(
                this.profile.email,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text('Name :', style: TextStyle(color:Colors.black, fontSize:12),),
              Text(
                this.profile.name == '' ? '(not set)' : this.profile.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text('Phone no. :', style: TextStyle(color:Colors.black, fontSize:12),),
              Text(
                this.profile.phoneNumber == '' ? '(not set)' : this.profile.phoneNumber,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {

                      },
                      icon: Icon(Icons.edit_attributes),
                      label: Text('Edit data', style: TextStyle(fontSize:12),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
