import 'package:demo_app/ui/alert/AlertPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cryptolist/CryptoHome.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'NewsPage.dart';
 bool get isIOS => foundation.debugDefaultTargetPlatformOverride == TargetPlatform.iOS;


class HomePage extends StatefulWidget {
  bool get isIOS => foundation.debugDefaultTargetPlatformOverride == TargetPlatform.iOS;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CryptoHome(),
    AlertPage(),
    NewsPage()
  ];
  
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return new CupertinoTabScaffold(
          tabBuilder: (context, index) {
            return _children[index];
          },
        resizeToAvoidBottomInset: false,
          tabBar: CupertinoTabBar(
             onTap: bottomNavTapped,
        currentIndex: _currentIndex,
        items: [
           BottomNavigationBarItem(icon: new Icon(CupertinoIcons.person), title: new Text("Crypto")),
           BottomNavigationBarItem(icon: new Icon(CupertinoIcons.bell), title: new Text("Alerts")),
           BottomNavigationBarItem(icon: new Icon(CupertinoIcons.book_solid), title: new Text("News")),
        ],
          ),
      );
    }
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomNavTapped,
        currentIndex: _currentIndex,
        items: [
           BottomNavigationBarItem(icon: new Icon(Icons.perm_camera_mic), title: new Text("Crypto")),
           BottomNavigationBarItem(icon: new Icon(Icons.notification_important), title: new Text("Alerts")),
           BottomNavigationBarItem(icon: new Icon(Icons.book), title: new Text("News")),
        ],
      ),
    );
  }

  void bottomNavTapped(int index) {
    setState(() {
        _currentIndex = index;
      });
  }
}