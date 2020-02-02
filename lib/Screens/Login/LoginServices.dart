import 'package:firebase_auth/firebase_auth.dart';
abstract class AuthFunc{
    Future <String> signIn(var _email , var _pass) ;
    Future <String> signUp(var _email , var _pass) ;
    Future <FirebaseUser> getUser() ;
    Future <void> sendVerification();
    Future <void> signOut();
    Future <bool> isVarified();
}

class AuthUser implements AuthFunc {
  FirebaseAuth firebaseAuth =  FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getUser() async {
    return await firebaseAuth.currentUser();
  }

  @override
  Future<bool> isVarified() async {
    var user  =  await firebaseAuth.currentUser();
    return user.isEmailVerified;
      
  }

  @override
  Future<void> sendVerification() async {
    var user  = await firebaseAuth.currentUser();
      user.sendEmailVerification();
  }

  @override
  Future<String> signIn(_email, _pass) async {
    var user =   ( await firebaseAuth.signInWithEmailAndPassword(email: _email, password: _pass)).user;
    return user.uid;
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future<String> signUp(_email, _pass) async {
   var user =  (await firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _pass)).user;
    return user.uid ;  
  }

}
