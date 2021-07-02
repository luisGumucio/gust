import 'package:dynamiclink/screens/client/client_order_detail_item.dart';
import 'package:dynamiclink/screens/home/home.dart';
import 'package:dynamiclink/services/auth.dart';
import 'package:dynamiclink/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CLientItemDetailCard extends StatefulWidget {
  const CLientItemDetailCard({Key? key}) : super(key: key);

  @override
  _CLientItemDetailCardState createState() => _CLientItemDetailCardState();
}

class _CLientItemDetailCardState extends State<CLientItemDetailCard> {
  late User firebaseUser;

  @override
  Widget build(BuildContext context) {
    firebaseUser = context.watch<AuthService>().getCurrentUser();
    return Theme(
        data: AppTheme.buildLightTheme(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Detalle del pedido',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0)),
                    SizedBox(height: 18.0),
                    Expanded(
                        child: ListView.builder(
                            itemCount: 200,
                            itemBuilder: (BuildContext context, int index) {
                              return new ClientOrderDetailItem();
                            })),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(user: firebaseUser)),
                        );
                      },
                      color: Colors.cyan,
                      height: 50.0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.9)),
                      child: Text(
                        'Realizar Pedido',
                        style: TextStyle(
                            color: AppTheme.buildLightTheme().backgroundColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    )
                  ],
                ),
              ),
            )));
  }
}
