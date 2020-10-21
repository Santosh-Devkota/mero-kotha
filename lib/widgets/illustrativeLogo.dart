import 'package:flutter/material.dart';

class IllustrativeLogo extends StatelessWidget {
  final double availableHeight;
  final double availbleWidth;
  IllustrativeLogo({this.availableHeight, this.availbleWidth});
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Image.asset(
            "assets/icons/illustration.png",
            width: deviceSize.width * 0.5,
            height: deviceSize.height * 0.15,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: Image.asset("assets/images/brandlogo.png",
              height: 60, width: 70, fit: BoxFit.cover),
          bottom: 20,
        )
      ],
    );
  }
}
