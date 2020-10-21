import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

import '../conf.dart';

class LoginCreateButton extends StatelessWidget {
  final String buttonText;
  LoginCreateButton({this.buttonText});
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: 50,
      width: 300,
      curveType: CurveType.none,
      color: backgroundColor,
      spread: 0,
      depth: 200,
      child: Center(
        child: Text(buttonText,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      borderRadius: 10.0,
    );
  }
}
