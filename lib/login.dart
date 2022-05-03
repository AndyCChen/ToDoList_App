import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth  = FirebaseAuth.instance;

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
                    fontSize: 24.0,
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
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Password',
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
                  ElevatedButton(
                    child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    onPressed: (){
                      auth.createUserWithEmailAndPassword(
                          email: _email,
                          password: _password);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => App())
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(104, 146, 255, 0.76),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      auth.signInWithEmailAndPassword(
                          email: _email,
                          password: _password);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => App())
                      );
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
