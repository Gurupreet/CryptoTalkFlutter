import 'package:demo_app/Data/models/Crypto.dart';
import 'package:demo_app/ui/cryptodetail/CryptoDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math';

Widget mainListItem(context, Crypto crypto) {
  String symbol = "btc";
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
  return Card(
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return CryptoDetailPage(crypto);
            }));
          },
          child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: 10,
                                    child: VerticalDivider(
                                        color: crypto.dayChange > 0
                                            ? Colors.green
                                            : Colors.red)),
                                Image(
                                  image: AssetImage(
                                      "assets/cryptoIcons/$symbol.png"),
                                  width: 30,
                                  height: 30,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(crypto.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(crypto.exchange)
                                      ],
                                    )),
                              ]),
                          Hero(
                              tag: "sparkline",
                              child: Container(
                                  width: 80.0,
                                  height: 30.0,
                                  child: new Sparkline(
                                      data: data,
                                      lineColor: crypto.dayChange > 0
                                          ? Colors.green
                                          : Colors.red))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  crypto.lastPrice.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(crypto.dayChange.toString(),
                                    style: TextStyle(
                                        color: crypto.dayChange > 0
                                            ? Colors.green
                                            : Colors.red))
                              ],
                            ),
                          )
                        ]),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text("1H"),
                          Text(crypto.dayChange.toString())
                        ]),
                        Column(children: <Widget>[
                          Text("1D"),
                          Text(crypto.dayChangePercentage.toString())
                        ]),
                        Column(children: <Widget>[
                          Text("1W"),
                          Text(crypto.dayLow.toString())
                        ]),
                        Column(children: <Widget>[
                          Text("High"),
                          Text(crypto.dayHigh.toString())
                        ]),
                        Column(children: <Widget>[
                          Text("Low"),
                          Text(crypto.dayLow.toString())
                        ]),
                        Column(children: <Widget>[
                          Text("Vol"),
                          Text(crypto.volumeTraded.toString())
                        ])
                      ],
                    ),
                  ]))));
}
