import 'dart:async';

import 'package:demo_app/Data/FirebaseManager.dart';
import 'package:demo_app/Data/models/Crypto.dart';
import 'package:demo_app/util/FirebaseStreamObserver.dart';
import 'package:demo_app/ui/cryptolist/MainListItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AllList extends StatefulWidget {
  @override
  _AllListState createState() => _AllListState();
}

class _AllListState extends State<AllList> {
   List<Crypto> data = new List();
  Stream<Event> dataStream = FirebaseManager().getAllStream;
  @override
  Widget build(BuildContext context) {
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
                return mainListItem(context, data[position]);
              },
              itemCount: data.length,
            ));
          }
        );
  }
}