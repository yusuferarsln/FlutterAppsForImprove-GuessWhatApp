import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_what/controller.dart';
import 'package:guess_what/services/auths_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('register'),
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
                          'Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: TextField(
                          controller: nameController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: emailController,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 70,
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
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, shape: StadiumBorder()),
                child: Text('sign up'),
                onPressed: () {
                  AuthController.instance.register(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      nameController.text.trim());
                },
              ),
            ],
          ),
        ));
  }
}
