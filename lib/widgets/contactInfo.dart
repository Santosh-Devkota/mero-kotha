import 'package:flutter/material.dart';
import '../conf.dart';

class ContactInfo extends StatefulWidget {
  // final Function addMobileController;
  // final Function removeMobileController;
  final List<TextEditingController> mobControllers;
  ContactInfo(
      {
      // this.addMobileController,
      // this.removeMobileController,
      this.mobControllers});
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  int index = 1;
  // List<TextEditingController> _mobileController = [];
  bool firstLoad = true;
  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      // to add controller for the first time in only first build
      widget.mobControllers.add(TextEditingController());
      firstLoad = false;
    }
    // return Builder(
    //   builder: (context) {
    //     for (var i = 0; i < widget.mobControllers.length; i++) {
    //       return _buildContactInformation(
    //           context, widget.mobControllers[i], i + 1);
    //     }
    //   },
    // );
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < widget.mobControllers.length; i++)
            ..._buildContactInformation(
                context, widget.mobControllers[i], i + 1)
        ],
      );
    });
    // return Container(
    //   child: for (var i = 0; i < widget.mobControllers.length; i++) ,
    // )
  }

  List<Widget> _buildContactInformation(
      BuildContext ctx, TextEditingController _controller, int fieldNumber) {
    return [
      fieldNumber == 1
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
              child: Text(
                "Contact",
                style: Theme.of(ctx).textTheme.bodyText2,
              ),
            )
          : Container(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              maxLines: 1,
              controller: _controller,
              keyboardType: TextInputType.number,
              validator: (val) => validateMobile(val),
              style: TextStyle(
                  height: 1.50,
                  color: backgroundColor,
                  fontSize: 22.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600),
              cursorColor: backgroundColor.withOpacity(.6),
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: backgroundColor,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  errorStyle: Theme.of(ctx)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.red, fontSize: 16),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  fillColor: backgroundColor.withOpacity(0.15),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: backgroundColor, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter your phone",
                  hintStyle: TextStyle(
                      color: backgroundColor.withOpacity(.7),
                      fontWeight: FontWeight.normal)),
            ),
          ),
          (fieldNumber == 1)
              ? InkWell(
                  onTap: () {
                    if (widget.mobControllers.length < maxMobileNumbers) {
                      setState(() {
                        // phoneCount++;
                        widget.mobControllers.add(TextEditingController());
                      });
                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 5, bottom: 5, right: 5),
                    child: Icon(Icons.add_circle_outline),
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      // phoneCount--;
                      widget.mobControllers.removeAt(fieldNumber - 1);
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 5, bottom: 5, right: 5),
                    child: Icon(Icons.cancel),
                  ),
                ),
        ],
      ),
      SizedBox(
        height: 5,
      )
    ];
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    //widget.setMobileNums(value);
    return null;
  }
}
