import 'package:dynamiclink/screens/home/home.dart';
import 'package:dynamiclink/services/auth.dart';
import 'package:dynamiclink/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: AppTheme.buildLightTheme().accentColor),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Column(children: [getWidgetAuthentication(context)])),
        ));
  }

  Widget getWidgetAuthentication(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthService>()
                      .signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      )
                      .then((value) {
                    var user = value as User;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home(user: user)),
                    );
                  });
                },
                child: Text("Ingresar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// [
//                   TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: "Email",
//                     ),
//                   ),
//                   TextField(
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<AuthService>().signIn(
//                             email: emailController.text.trim(),
//                             password: passwordController.text.trim(),
//                           );
//                     },
//                     child: Text("Sign in"),
//                   )
//                 ],
