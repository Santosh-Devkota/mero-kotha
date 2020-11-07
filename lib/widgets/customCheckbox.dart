import 'package:flutter/material.dart';
import 'package:mero_kotha/conf.dart';

class CustomCheckbox extends StatefulWidget {
  final int index;
  CustomCheckbox(this.index);
  // final checkBoxVal;
  // final toogleCheckBox;
  // CustomCheckbox(this.checkBoxVal, this.toogleCheckBox);
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value=!value;
          listFacilities[widget.index].value=value;

          // widget.toogleCheckBox();
        });
      },
      // child: Container(
      //   decoration:
      //       BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue),
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: value
      //         ? Icon(
      //             Icons.check,
      //             size: 20.0,
      //             color: Colors.white,
      //           )
      //         : Icon(
      //             Icons.check_box_outline_blank,
      //             size: 20.0,
      //             color: Colors.blue,
      //           ),
      //   ),
      // ),
      child: Container(
          //color: backgroundColor.withOpacity(0.2),
          height: 22,
          width: 22,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: backgroundColor,
              ),
              color: backgroundColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(5)),
          child: value
              ? Icon(
                  Icons.check,
                  size: 20.0,
                  color: backgroundColor,
                )
              // : Icon(
              //     Icons.check_box_outline_blank,
              //     size: 20.0,
              //     color: Colors.blue,
              //   ),
              : Container()
              ),
    );
  }
}
