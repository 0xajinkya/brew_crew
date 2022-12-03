import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign In Anonymously
  Future<dynamic> signInAnom() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e){
      print(e.toString());
      return null;
    }
  }


  //Sign In With Email And Password

  


  //Register With Email And Password


  //Sign Out


}