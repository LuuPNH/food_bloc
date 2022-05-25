import 'package:flutter/material.dart';

class AppDialog {
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Check out success!'),
          content: SingleChildScrollView(
            child: Center(
              child: ListBody(
                children: const <Widget>[
                  Text('Your order has been pair'),
                  Text('Food will arrive to you a few minutes'),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
