import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/cupertino.dart';
import 'BTCList.dart';
import 'EOSList.dart';
import 'ETHList.dart';
import 'AllList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool get isIOS =>
    foundation.debugDefaultTargetPlatformOverride == TargetPlatform.iOS;

class CryptoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "BTC", icon: Icon(FontAwesomeIcons.btc)),
                Tab(text: "ETH", icon: Icon(FontAwesomeIcons.ethereum)),
                Tab(text: "EOS", icon: Icon(FontAwesomeIcons.btc)),
                Tab(text: "USD", icon: Icon(FontAwesomeIcons.dollarSign))
              ],
            ),
            title: Text('Crypto'),
            actions: <Widget>[Icon(Icons.search)]),
        body: TabBarView(
          children: [
            BTCList(),
            ETHList(),
            EOSList(),
            AllList(),
          ],
        ),
      ),
    );
  }
}
