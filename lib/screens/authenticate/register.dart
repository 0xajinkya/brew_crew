import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  const Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = '';
  String password = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

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
              label: Text('Sign In')
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formkey,
            child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Enter An Email': null,
                    onChanged: (val){
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => val!.length < 6 ? 'Enter Strong Password': null,
                    obscureText: true,
                    onChanged: (val){
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        if(_formkey.currentState!.validate()){
                            print(email);
                            print(password);
                            dynamic result = _auth.registerWithEmailAndPassword(email, password);
                            print(result);
                            if(result == null){
                              setState(() {
                                error = 'Please Supply A Valid Email';
                              });
                            }
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                  ),
                  SizedBox(height: 12),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  )
                ]
            )
        ),
      ),
    );
  }
}
