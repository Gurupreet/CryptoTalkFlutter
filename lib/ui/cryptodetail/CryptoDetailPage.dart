import 'package:demo_app/Data/models/Crypto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math';

class CryptoDetailPage extends StatelessWidget {
  final Crypto crypto;
  CryptoDetailPage(this.crypto);

  @override
  Widget build(BuildContext context) {
    var random = new Random();
    var data = [
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(crypto.name),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: crypto.name,
                    child: Container(
                        padding: EdgeInsets.only(top: 60),
                        width: 80.0,
                        height: 30.0,
                        child: new Sparkline(
                            data: data,
                            lineColor: crypto.dayChange > 0
                                ? Colors.green
                                : Colors.red)))),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10), child: Icon(Icons.add_alert)),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(FontAwesomeIcons.chartLine))
            ],
          ),
          SliverFillRemaining(
            child: Text(crypto.dayChange.toString()),
          )
        ],
      ),
    );
  }
}
