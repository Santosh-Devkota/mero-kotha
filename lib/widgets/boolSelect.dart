import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/model/facilities.dart';
import 'package:mero_kotha/widgets/customCheckbox.dart';

class BoolSelect extends StatelessWidget {
  final index;
  final Facilities propertyFacility;
  BoolSelect({this.index, this.propertyFacility});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CustomCheckbox(),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ClayContainer(
              height: 40,
              spread: 3,
              depth: 50,
              color: baseColor,
              borderRadius: 5,
              child: Row(
                children: [
                  ClayContainer(
                    depth: 100,
                    spread: 1,
                    borderRadius: 5,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      //child: Icon(Icons.wifi),
                      child: listFacilities[index].icon,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                      //"${roomFacilities[index]["title"]}",
                      "${listFacilities[index].name}"),
                  // DropdownButton<String>(
                  //     value: "1",
                  //     items: [
                  //       DropdownMenuItem<String>(
                  //         value: "1",
                  //         child: Text("1"),
                  //       ),
                  //       DropdownMenuItem<String>(
                  //         value: "2",
                  //         child: Text("2"),
                  //       ),
                  //       DropdownMenuItem<String>(
                  //         value: "3",
                  //         child: Text("3"),
                  //       ),
                  //     ],
                  //     onChanged: null)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
