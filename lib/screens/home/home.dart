import 'package:brew_crew/screens/home/brew_list.data.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {

  Home({super.key});

  final AuthService _auth = AuthService();
  late String uid = '';
  @override
  void initState() {
    Future<dynamic>? getUID() async {
      final prefs = await SharedPreferences.getInstance();
      uid = prefs.getString('uid') as String;
    }
    getUID();
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      // initialData: null,
      value: DatabaseService(uid: uid!).brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('BrewCrew'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}