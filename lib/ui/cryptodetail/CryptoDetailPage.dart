import 'package:demo_app/Data/models/Crypto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class CryptoDetailPage extends StatelessWidget {
  final Crypto crypto;
  CryptoDetailPage(this.crypto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(crypto.name),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: Text("flex"),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10), child: Icon(Icons.add_alert)),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(FontAwesomeIcons.chartLine))
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Hero(
                  tag: "sparkline",
                  child: Container(
                      width: 80.0,
                      height: 30.0,
                      child: new Sparkline(
                          data: [1.0, 3.0, 4.0, 5.0, 7.0, 8.0, 5.0, 4.0],
                          lineColor: crypto.dayChange > 0
                              ? Colors.green
                              : Colors.red)))
            ]),
          )
        ],
      ),
    );
  }
}
