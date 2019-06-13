import 'dart:async';

import 'package:demo_app/Data/FirebaseManager.dart';
import 'package:demo_app/Data/models/Crypto.dart';
import 'package:demo_app/ui/cryptolist/MainListItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EOSList extends StatefulWidget {
  @override
  _EOSListState createState() => _EOSListState();
}

class _EOSListState extends State<EOSList> {
 List<Crypto> data = new List();
  Stream<Event> dataStream = FirebaseManager().getEOSStream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dataStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Failed to load data"));
          } else if (snapshot == null || snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            Event event = snapshot.data;
            List<dynamic> l = event.snapshot.value.values.toList();
            l.forEach((f) => {data.add(Crypto.fromMap(f))});
            return Container(
                child: ListView.builder(
              itemBuilder: (context, position) {
                return mainListItem(context, data[position]);
              },
              itemCount: data.length,
            ));
          }
        });
  }
}