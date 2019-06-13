import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/cupertino.dart';
import 'BTCList.dart';
import 'EOSList.dart';
import 'ETHList.dart';
import 'AllList.dart';

bool get isIOS => foundation.debugDefaultTargetPlatformOverride == TargetPlatform.iOS;
class CryptoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   if (isIOS) { 
     return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "BTC"),
                Tab(text: "ETH"),
                Tab(text: "EOS"),
                Tab(text: "ALL")
              ],
            ),
            title: Text('Crypto'),
            actions: <Widget>[Icon(Icons.search)]
          ),
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
    } else {
      return  DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "BTC"),
                Tab(text: "ETH"),
                Tab(text: "EOS"),
                Tab(text: "ALL")
              ],
            ),
            title: Text('Crypto'),
            actions: <Widget>[Padding(child:Icon(Icons.search), padding: const EdgeInsets.all(10.0),)],
          ),
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
}