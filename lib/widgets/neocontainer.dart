import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class NeoContainer extends StatelessWidget {
  final double height;
  final double width;
  final CurveType curveType;
  final Widget child;

  const NeoContainer({Key key,@required this.height,@required this.width,@required this.curveType,this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  Color baseColor = Color(0xFFF2F2F2);
    return Container(
        color: baseColor,
        child: Center(
          child: ClayContainer(
            color: baseColor,
            height: height??150,
            width:width?? 150,
        
            curveType:curveType,
            child: child,
          ),
        
        ),
      );
  }
}