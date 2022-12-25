import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vinted_like/Auth/register.dart';
import 'package:vinted_like/home_page.dart';
import 'package:vinted_like/bottom_bar.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submitOnLogin() async {
  final isValid = _formKey.currentState!.validate();
  FocusScope.of(context).unfocus();
  if(isValid){
    print('Form VAlID!');

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _username.text.trim(), password: _password.text.trim());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomBarPage())
      );
    }
    catch (e) {
      print(e);
    }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black54, BlendMode.darken),
            ),
          ),
        ),


        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to MIAGED', style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 30.0,
                fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            const Text('A unique marketplace for clothes!', style:
            TextStyle(color: Colors.deepOrange,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            const Text('Buy and sell clothes with other users', style:
            TextStyle(color: Colors.deepOrange,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),


           const SizedBox(height: 50.0),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black54,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black54,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      focusNode: _passwordFocus,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _submitOnLogin,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20.0),
                    const Text('Don\'t have an account?', style:
                    TextStyle(color: Colors.cyanAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20.0),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );

    Future LoginPage() async {

    }

  }
}


         /*   Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: _username,
                decoration: const InputDecoration(
                  hintText: 'Enter Username',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,

                  fillColor: Colors.black54,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: _password,
                focusNode: _passwordFocus,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black54,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                obscureText: true,
                onSubmitted: (String value) {
                  _submitOnLogin();
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitOnLogin,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0),
            const Text('Don\'t have an account?', style:
                 TextStyle(color: Colors.cyanAccent, fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),

        ),
            Form(
              key: _formKey,
                child:

            ),
      ],
      ),*/
