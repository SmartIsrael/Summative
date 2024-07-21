import 'package:fluttertest/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = '';

  // Future<void> _signInWithEmailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //     _navigateToHome();
  //     // setState(() {
  //     //   _message = 'Successfully signed in as ${userCredential.user?.email}';
  //     // });
  //   } catch (e) {
  //     setState(() {
  //       _message = 'Failed to sign in with Email & Password\n${e.toString()}';
  //     });
  //   }
  // }

  // Future<void> _registerWithEmailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //     // _navigateToHome();
  //     setState(() {
  //       _message = 'Successfully registered as ${userCredential.user?.email}';
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _message = 'Failed to register with Email & Password\n${e.toString()}';
  //     });
  //   }
  // }

  // Future<void> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       final UserCredential userCredential = await _auth.signInWithCredential(credential);
  //       _navigateToHome();
  //       setState(() {
  //         _message = 'Successfully signed in as ${userCredential.user?.displayName}';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _message = 'Failed to sign in with Google\n${e.toString()}';
  //     });
  //   }
  // }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  // _signInWithEmailAndPassword();

                },
                child: const Text('Sign in with Email'),
              ),
              ElevatedButton(
                onPressed: (){
                  // _registerWithEmailAndPassword();
                },
                child: const Text('Register with Email'),
              ),
              ElevatedButton(
                onPressed: (){
                  // _signInWithGoogle();
                },
                child: const Text('Sign in with Google'),
              ),
              const SizedBox(height: 20),
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }
}
