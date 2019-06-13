import 'package:demo_app/data/models/Alert.dart';
import 'package:flutter/material.dart';

class AlertListItem extends StatefulWidget {
  final Alert alert;
  const AlertListItem({Key key, this.alert}): super(key: key);

  @override
  _AlertListItemState createState() => _AlertListItemState();
}

class _AlertListItemState extends State<AlertListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: Text("data"),
      
    );
  }
}