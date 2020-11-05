import 'package:flutter/material.dart';
import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/model/facilities.dart';

class NumberSelect extends StatefulWidget {
  final Facilities facility;
  NumberSelect({this.facility});
  @override
  _NumberSelectState createState() => _NumberSelectState();
}

class _NumberSelectState extends State<NumberSelect> {
  List<String> numbers = ["1", "2", "3", "4", "5", "6+"];
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          widget.facility.name,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 18,
              ),
        ),
        Container(
          height: 35,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: numbers.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  widget.facility.selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: (index == widget.facility.selectedIndex)
                      ? backgroundColor
                      : baseColor,
                  border: Border.all(
                    width: 1.0,
                    color: backgroundColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    numbers[index],
                    style: (index == widget.facility.selectedIndex)
                        ? Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white)
                        : Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: backgroundColor),
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
