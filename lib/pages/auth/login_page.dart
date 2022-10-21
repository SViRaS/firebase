import 'package:firebase_app/pages/auth/register_page.dart';
import 'package:firebase_app/widget/widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Groupie',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login now to see what ther are talking!',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              Image.asset('assets/pages/login.png'),
              TextFormField(
                decoration: TextInputDecoration.copyWith(
                    labelText: 'Email',
                    prefix: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    )),
                validator: (val) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                      ? null
                      : "Please enter a valid email";
                },
                onChanged: (val) {
                  email = val;
                  print(email);
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                decoration: TextInputDecoration.copyWith(
                    labelText: 'Password',
                    prefix: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    )),
                validator: (val) {
                  if (val!.length < 6) {
                    return "Password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  password = val;
                  print(password);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                 
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register here',
                        style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {
                        nextScreen(context, const RegisterPage());
                        }
                      )
                    ]
                  )
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  login() async {
    if (formKey.currentState!.validate()) {}
    ;
  }
}
