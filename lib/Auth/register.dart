import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vinted_like/consts/firebase_consts.dart';
import 'package:vinted_like/widgets/text_widget.dart';
import 'package:vinted_like/Auth/login.dart';
import 'package:vinted_like/consts/firebase_consts.dart';




class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _cityTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  bool _obscureText = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _cityTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
    _cityFocusNode.dispose();
    super.dispose();
  }



  void _submitOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      try {
        await authInstance.createUserWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passTextController.text
        );
        print('Registration Succesfull!');

       // AlertDialog(title: Text("Registration done!"),);

        Navigator.pop(context);

      } catch (error) {
        print("An Error Occured!! $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

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

          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(
                  height: 60.0,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () =>
                  Navigator.canPop(context) ? Navigator.pop(context) : null,
                  child: Icon(
                    IconlyLight.arrow_left_2,
                    color: Theme == true ? Colors.white : Colors.black,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextWidget(
                  text: 'Welcome visitor!',
                  color: Colors.red,
                  textSize: 30,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  text: "Sign up to continue:",
                  color: Colors.grey,
                  textSize: 18,
                  isTitle: false,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context)
                                .requestFocus(_emailFocusNode),
                        keyboardType: TextInputType.name,
                        controller: _fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This Field is missing";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Full name',
                          hintStyle: TextStyle(color: Colors.lightBlue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_passFocusNode),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextController,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please enter a valid Email address";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.lightBlue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Password
                      TextFormField(
                        focusNode: _passFocusNode,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passTextController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return "Please enter a valid password";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        onEditingComplete: () =>
                            FocusScope.of(context)
                                .requestFocus(_addressFocusNode),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.lightBlue),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        focusNode: _addressFocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _submitOnRegister,
                        controller: _addressTextController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return "Please enter a valid  address";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(color: Colors.lightBlue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        focusNode: _cityFocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _submitOnRegister,
                        controller: _cityTextController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "Please enter a valid  city";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'City',
                          hintStyle: TextStyle(color: Colors.lightBlue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: _submitOnRegister,
                  child: const Text('SEND IT!'),
                ),

                /* AuthButton(
  buttonText: 'Sign up',
  fct: () {
  _submitOnRegister();
  },
  ),

    */
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Already a user?',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign in',
                            style: const TextStyle(
                                color: Colors.lightBlue, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                                print("test");
                              }),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


/* class  extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to register page', style: TextStyle(color: Colors.lightGreen)),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: const Center(
          child: Text('THIS IS THE REGISTER PAGE')
      ),
    );
  }
}
*/
}