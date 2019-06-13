import 'package:firebase_database/firebase_database.dart';

class FirebaseManager {
  Stream<Event> get getBTCStream => FirebaseDatabase.instance
      .reference()
      .child("symbols")
      .child("BTC").orderByChild("volume_traded")
      .onValue;
  Stream<Event> get getETHStream => FirebaseDatabase.instance
      .reference()
      .child("symbols")
      .child("ETH").orderByChild("volume_traded")
      .onValue;
  Stream<Event> get getEOSStream => FirebaseDatabase.instance
      .reference()
      .child("symbols")
      .child("EOS").orderByChild("volume_traded")
      .onValue;
  Stream<Event> get getAllStream => FirebaseDatabase.instance
      .reference()
      .child("symbols")
      .child("OTHERS").orderByChild("volume_traded")
      .onValue;
}

final FirebaseManager firebaseManager = new FirebaseManager();
