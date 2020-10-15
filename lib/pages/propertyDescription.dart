import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customCheckbox.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';
import 'package:mero_kotha/widgets/imageUpload.dart';

import '../conf.dart';

class PropertyDescriptionPage extends StatelessWidget {
  final String selectedProperty;
  PropertyDescriptionPage(this.selectedProperty);
  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final selectedPropertyTitle = selectedProperty.toUpperCase();
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        key: _key,
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(60.0),
          scaffoldKey: _key,
        ),
        body: Container(
          color: baseColor,
          height: deviceSize.height,
          width: deviceSize.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPropertyType(context, selectedPropertyTitle),
                          ImageUpload(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildLocationInformation(context),
                      SizedBox(
                        height: 20,
                      ),
                      _buildPropertyFacilities(context),
                      SizedBox(
                        height: 20,
                      ),
                      ..._buildPriceInput(context),
                      SizedBox(
                        height: 20,
                      ),
                      ..._buildContactInformation(context),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {},
                          child: ClayContainer(
                            spread: 1,
                            depth: 100,
                            height: 50,
                            width: 150,
                            curveType: CurveType.none,
                            color: backgroundColor,
                            child: Center(
                              child: Text("Add",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                            ),
                            borderRadius: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPriceInput(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        child: Text(
          "Price",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      TextFormField(
        maxLines: 1,
        style: TextStyle(
            height: 1.50,
            color: backgroundColor,
            fontSize: 22.0,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600),
        cursorColor: backgroundColor.withOpacity(.6),
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 5),
              child: Text(
                "Rs.",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            errorStyle: Theme.of(context)
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
            hintText: "Enter your price",
            hintStyle: TextStyle(
                color: backgroundColor.withOpacity(.7),
                fontWeight: FontWeight.normal)),
      ),
    ];
  }

  Widget _buildPropertyType(BuildContext context, String propertyTitle) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
          child: Text(
            "Property",
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 28),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClayContainer(
            height: 60,
            width: 100,
            curveType: CurveType.none,
            color: baseColor,
            child: Container(
              // width: 80,
              // height: 70,
              alignment: Alignment.center,
              // child: Image.network(
              //   homeItem.icon,
              //   fit: BoxFit.fill,
              //   height: 60,
              //   width: 60,
              // ),
              child: Image.asset(
                "assets/images/brandlogo.png",
                fit: BoxFit.fill,
                height: 60,
                width: 60,
              ),
            ),
            borderRadius: 10.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "$propertyTitle",
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInformation(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 0),
              child: Icon(
                Icons.add_location,
                size: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add Location",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
        TextFormField(
          maxLines: 1,
          style: TextStyle(
              height: 1.50,
              color: backgroundColor,
              fontSize: 22.0,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600),
          cursorColor: backgroundColor.withOpacity(.6),
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              errorStyle: Theme.of(context)
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
              hintText: "City Name",
              hintStyle: TextStyle(
                  color: backgroundColor.withOpacity(.7),
                  fontWeight: FontWeight.normal)),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: 1,
          style: TextStyle(
              height: 1.50,
              color: backgroundColor,
              fontSize: 22.0,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600),
          cursorColor: backgroundColor.withOpacity(.6),
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              errorStyle: Theme.of(context)
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
              hintText: "Chowk Name",
              hintStyle: TextStyle(
                  color: backgroundColor.withOpacity(.7),
                  fontWeight: FontWeight.normal)),
        ),
      ],
    );
  }

  Widget _buildPropertyFacilities(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
          child: Text(
            "Room Facilities",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        ListView.builder(
            // padding: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            // primary: false,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: roomFacilities.length,
            itemBuilder: (context, index) {
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
                                  child: Icon(Icons.wifi),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${roomFacilities[index]["title"]}",
                              ),
                              DropdownButton<String>(
                                  value: "1",
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: "1",
                                      child: Text("1"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "2",
                                      child: Text("2"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "3",
                                      child: Text("3"),
                                    ),
                                  ],
                                  onChanged: null)
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
            })
      ],
    );
  }

  List<Widget> _buildContactInformation(BuildContext ctx) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        child: Text(
          "Contact",
          style: Theme.of(ctx).textTheme.bodyText2,
        ),
      ),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: 1,
              style: TextStyle(
                  height: 1.50,
                  color: backgroundColor,
                  fontSize: 22.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600),
              cursorColor: backgroundColor.withOpacity(.6),
              keyboardType: TextInputType.emailAddress,
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
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.add_circle_outline),
            ),
          )
        ],
      )
    ];
  }
}
