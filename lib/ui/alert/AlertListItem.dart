import 'package:demo_app/data/models/Alert.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/Data/models/Crypto.dart';

class AlertListItem extends StatefulWidget {
  final Crypto crypto;
  const AlertListItem({Key key, this.crypto}) : super(key: key);

  @override
  _AlertListItemState createState() => _AlertListItemState();
}

class _AlertListItemState extends State<AlertListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Container(
                  height: 50,
                  width: 10,
                  child: VerticalDivider(
                      color: widget.crypto.dayChange > 0
                          ? Colors.green
                          : Colors.red)),
              Image(
                image: AssetImage("assets/cryptoIcons/btc.png"),
                width: 30,
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.crypto.symbol,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.crypto.lastPrice.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.crypto.dayChange.toString(),
                      style: TextStyle(
                          color: widget.crypto.dayChange > 0
                              ? Colors.green
                              : Colors.red))
                ],
              ),
            )
          ]),
    );
  }
}
