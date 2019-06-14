import 'package:flutter/material.dart';
import 'package:demo_app/Data/FirebaseManager.dart';
import 'package:demo_app/util/FirebaseStreamObserver.dart';
import 'package:demo_app/Data/models/Crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'AlertListItem.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Alerts")),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Add alert"),
          icon: Icon(Icons.add_alert),
          onPressed: () {},
        ),
        body: AlertList());
  }
}

class AlertList extends StatefulWidget {
  @override
  _AlertListState createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  @override
  Widget build(BuildContext context) {
    List<Crypto> data = new List();
    Stream<Event> dataStream = FirebaseManager().getBTCStream;
    return FirebaseStreamObserver(
        stream: dataStream,
        onSuccess: (context, event) {
          List<dynamic> l = event.snapshot.value.values.toList();
          Iterable reversed = l.reversed;
          var rev = reversed.toList();
          rev.forEach((f) => {data.add(Crypto.fromMap(f))});
          return Container(
              child: ListView.builder(
            itemBuilder: (context, position) {
              return AlertListItem(data[position]);
            },
            itemCount: data.length,
          ));
        });
  }
}
