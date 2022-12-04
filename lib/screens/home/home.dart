import 'package:brew_crew/services/auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}