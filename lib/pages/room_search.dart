import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';

class RoomSearch extends StatefulWidget {
  @override
  _RoomSearchState createState() => _RoomSearchState();
}

class _RoomSearchState extends State<RoomSearch> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        appBar: MyAppbar(preferredSize: Size.fromHeight(60.0)),
        body: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ImageSlider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
