import 'package:flutter/material.dart';


class FirebaseStreamObserver<T> extends StatelessWidget {
  @required
  final Stream<T> stream;
  @required
  final Function onSuccess;

  final Function onError;

  const FirebaseStreamObserver({this.onSuccess, this.onError, this.stream});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError(context, snapshot.error);
        }
        if (snapshot.hasData) {
          T data = snapshot.data;
          return onSuccess(context, data);
        } else {
          return  Center(child: CircularProgressIndicator())
          ;
        }
      },
    );
  }
}