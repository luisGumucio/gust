import 'package:dynamiclink/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget body;
  @override
  void initState() {
    super.initState();
    body = CircularProgressIndicator();
    _getBodyByRol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              context.read<AuthService>().signOut();
            },
          )
        ],
      ),
      body: body,
    );
  }

  _getBodyByRol() {
    widget.user.getIdTokenResult(true).then((value) {
      var claims = value.claims!['roles'];
      if (claims == 'client') {
        setState(() {
          body = Container(
            child: Text('hello client'),
          );
        });
      } else {
        setState(() {
          body = Container(
            child: Text('hello admin'),
          );
        });
      }
    });
  }
}
