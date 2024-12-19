import 'package:demo_app/components/my_textfield.dart';
import 'package:demo_app/components/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.onTap});
  final Function()? onTap;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//signInmethod
  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroler = TextEditingController();

    void signUserin() async {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      //try signi
      try {
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroler.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user_not_found') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  title: Text('incorrect email'),
                );
              });
        } else if (e.code == 'wrong password') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  title: Text('incorrect password'),
                );
              });
        }
      }
      Navigator.pop(context);
    }

//wrong email
    // void wrongEmailmessage() {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text('incorrect email'),
    //         );
    //       });

    //   //wrong password
    //   void wrongPasswordmessage() {
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             title: Text('incorrect password'),
    //           );
    //         });
    //   }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Welcome back,you have been missed'),
              const SizedBox(
                height: 50,
              ),
              MyTextfield(
                obscuretext: false,
                controller: emailcontroller,
                hinttext: 'email',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextfield(
                hinttext: 'password',
                obscuretext: true,
                controller: passwordcontroler,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Mybutton(
                onTap: signUserin,
                text: 'signIn',
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Text(
                      'or continue with ',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade200,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'images/google.png',
                          fit: BoxFit.contain,
                          width: 60,
                        ),
                        Text(
                          'SignIn with Google',
                          style: TextStyle(color: Colors.grey.shade700),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a meber?'),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register Now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
