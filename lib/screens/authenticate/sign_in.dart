import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  //Text Field State
  String email ='';
  String password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text('Sign In To Brew Crew'),
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val){
                    setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    // await _auth.signIn();
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              )
            ]
          )
        ),
      ),
    );
  }
}