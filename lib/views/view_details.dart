import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
