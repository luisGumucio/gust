import 'package:dynamiclink/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ItemCreateView extends StatefulWidget {
  String keyView;
  Function(String) callback;

  ItemCreateView(this.keyView, this.callback);

  @override
  _ItemCreateViewState createState() => _ItemCreateViewState();
}

class _ItemCreateViewState extends State<ItemCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('i am create'),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              widget.callback(widget.keyView);
            },
            child: const Icon(Icons.add),
            backgroundColor: AppTheme.buildLightTheme().accentColor));
  }
}
