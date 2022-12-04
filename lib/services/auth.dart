import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Auth Change User Stream
  Stream<User?> get user{
    return _auth.authStateChanges();
  }

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

  Future<dynamic> registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email,password: password);
      return(result);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //Sign Out

  Future<dynamic> signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e);
      return null;
    }
  }

}