import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/profile.dart';
import 'package:flutter_firebase_auth/pages/profile_tile.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {

    final profiles = Provider.of<List<Profile>>(context);

    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        return ProfileTile(profile: profiles[index],);
      },
    );
  }
}
