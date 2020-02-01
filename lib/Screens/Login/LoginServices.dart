import 'package:firebase_auth/firebase_auth.dart';

Future<AuthResult> signIn(var _email , var _password) async { 
  try{
    var  user =   await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email  ,  password: _password );
    return user ; 
  }catch(e){
    return null ; 
  }
}