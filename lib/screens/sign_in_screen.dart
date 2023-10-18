import 'package:flutter/material.dart';
import 'package:login_interface/utils/colors_utils.dart';
import 'package:login_interface/reusable_widgets/reusable_widgets.dart';
import 'package:login_interface/screens/home_screen.dart';
import 'package:login_interface/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor('#D14D72'),
              hexStringToColor('#FFABAB'),
              hexStringToColor('#FCC8D1'),
              hexStringToColor('#FEF2F4'),
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter
          )
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              330,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),

                const SizedBox(
                  height: 30
                ),

                reusableTextField(
                  "Enter Email",
                  Icons.person_outline,
                  false,
                  _emailController
                ),

                const SizedBox(
                  height: 30
                ),

                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordController
                ),

                const SizedBox(
                  height: 30
                ),

                reusableButton(
                  context,
                  true,
                  () {
                    try {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ).then(
                        (value) {
                          if (value.user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                          else{
                                print("hi");
                          }
                        },
                      );
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  },
                ),

                signUpOption()
              ]
            )
          )
        )
      ) 
    );
  }


 Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
