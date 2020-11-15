import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/room_slider_bloc.dart';
import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/model/department.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';
import 'package:mero_kotha/widgets/imageSlider.dart';

class Search extends StatefulWidget {
  final Department department;
  Search(this.department);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = new ScrollController();

    super.initState();
    BlocProvider.of<RoomSliderBloc>(context)
        .add(PremiumRoomsLoadEvent(widget.department.id));
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(60.0),
          appbarText: "${widget.department.name}s",
        ),
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
                    BlocBuilder<RoomSliderBloc, RoomSliderStates>(
                        builder: (context, state) {
                      if (state is PremiumRoomsLoadedState) {
                        return ImageSlider(state.premiumRooms);
                      } else if (state is PremiumRoomsLoadingState) {
                        return CircularProgressIndicator();
                      } else if (state is PremiumRoomsLoadFailedState) {
                        Text("Try Again!");
                      }
                      return Text("Try Again!");
                    }),
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
