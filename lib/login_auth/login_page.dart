import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_what/controller.dart';
import 'package:guess_what/login_auth/register_page.dart';
import 'package:guess_what/services/auths_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Guess What App Login Page')),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 4.0,
                    ),
                  ),
                  color: Colors.white70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                          radius: 90,
                          child: ClipRect(
                            child: Image.asset('assets/images/logo.png'),
                          ),
                          backgroundColor: Colors.white24),
                      SizedBox(height: 30),
                      Container(
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: TextField(
                          controller: emailController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, shape: StadiumBorder()),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    AuthController.instance.login(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black45, shape: StadiumBorder()),
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    child: Text('Sign Up')),
              )
            ],
          ),
        ));
  }
}
