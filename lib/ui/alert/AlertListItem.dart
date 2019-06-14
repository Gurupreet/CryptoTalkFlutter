import 'package:demo_app/data/models/Alert.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/Data/models/Crypto.dart';

class AlertListItem extends StatefulWidget {
  final Crypto alert;
  const AlertListItem(this.alert);

  @override
  _AlertListItemState createState() => _AlertListItemState();
}

class _AlertListItemState extends State<AlertListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: Text("Guru"),
    );
  }
}
