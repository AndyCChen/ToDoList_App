import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password, errorMessage  = '';
  bool isEmailValid = true, isPasswordValid = true;
  bool isSignUpEmailValid = true, isSignUpPasswordValid = true;

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found': {
        return 'Invalid Email';
      }
      case 'wrong-password': {
        return 'Invalid Password';
      }
      case 'invalid-email' : {
        return 'Invalid Email';
      }
      case 'too-many-requests' : {
        return 'Login Timeout';
      }
      case 'email-already-in-use' : {
        return 'Email already in use';
      }
      case 'weak-password': {
        return 'Weak Password';
      }
      default: {
        return 'Enter Email and Password';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText:'Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton (
                    child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    onPressed: () async {
                      try {
                        final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          isSignUpEmailValid = false;
                          setState(() {
                            errorMessage = _getErrorMessage(e.code);
                          });
                        } else if (e.code == 'weak-password') {
                          isSignUpPasswordValid = false;
                          setState(() {
                            errorMessage = _getErrorMessage(e.code);
                          });
                        }
                        else if (e.code =='invalid-email') {
                          isSignUpEmailValid = false;
                          setState(() {
                            errorMessage = _getErrorMessage(e.code);
                          });
                        }
                        else {
                          isPasswordValid = false;
                          isSignUpEmailValid = false;
                          setState(() {
                            errorMessage = _getErrorMessage(e.code);
                          });
                        }
                      }
                      if(isSignUpEmailValid && isSignUpPasswordValid) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const App()
                            )
                        );
                      } else {
                        isSignUpEmailValid = true;
                        isSignUpPasswordValid = true;
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
                    ),
                  ),
                  Text (
                    errorMessage,
                    style: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      try {
                        final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email,
                            password: _password
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          isEmailValid = false;
                          setState(() {
                            errorMessage =_getErrorMessage(e.code);
                          });
                        } else if (e.code == 'wrong-password') {
                          setState(() {
                            errorMessage =_getErrorMessage(e.code);
                          });
                          isPasswordValid = false;
                        } else if (e.code =='invalid-email'){
                          isEmailValid = false;
                          setState(() {
                            errorMessage = _getErrorMessage(e.code);
                          });
                        } else {
                          setState(() {
                            errorMessage =_getErrorMessage(e.code);
                          });
                          isEmailValid = false;
                          isPasswordValid = false;
                        }
                      }
                      if(isEmailValid && isPasswordValid) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const App()
                            )
                        );
                      } else {
                        isEmailValid = true;
                        isPasswordValid = true;
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
