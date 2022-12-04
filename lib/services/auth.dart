import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Auth Change User Stream
  Stream<User?> get user{
    return _auth.authStateChanges();
  }

  //Creating User Obj Based On Firebase User
  MyUser? _userFromFirebaseUser(User? user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //Sign In Anonymously
  Future<dynamic> signInAnom() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }


  //Sign In With Email And Password

  Future<dynamic> signInWithEmailAndPassword(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      prefs.setString('uid', result.user!.uid);
      print(prefs.getString('uid'));
      return _userFromFirebaseUser(result.user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }


  //Register With Email And Password

  Future<dynamic> registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email,password: password);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', result.user!.uid);
      print(prefs);
      //Creating A New Document For The User From UID
      await DatabaseService(uid: result.user!.uid).updateUserData('0', 100, 'New Crew Member');
      return _userFromFirebaseUser(result.user);
    } catch(e){
      print(e.toString());
      return ;
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