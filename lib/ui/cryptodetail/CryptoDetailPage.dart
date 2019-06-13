import 'package:demo_app/Data/models/Crypto.dart';
import 'package:flutter/material.dart';

class CryptoDetailPage extends StatelessWidget {
  final Crypto crypto;
  CryptoDetailPage(this.crypto);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name)
      ),
    );
  }
}