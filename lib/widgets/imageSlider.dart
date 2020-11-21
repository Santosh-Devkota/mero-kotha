import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/room_slider_bloc.dart';
import 'package:mero_kotha/model/property.dart';

class ImageSlider extends StatefulWidget {
  final List<Property> premiumProperty;
  ImageSlider(this.premiumProperty);
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<RoomSliderBloc>(context)
    //     .add(PremiumRoomsLoadEvent(widget.depId));
  }

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: deviceSize.width,
          height: 200.0,
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: widget.premiumProperty.length > 5
                    ? 5
                    : widget.premiumProperty.length,
                itemBuilder: (context, index) {
                  var property = widget.premiumProperty[index];
                  return Container(
                    height: 200.0,
                    width: deviceSize.width,
                    color: Colors.grey,
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                            child: CachedNetworkImage(
                              imageUrl: property.photos[0],
                              fit: BoxFit.cover,
                              width: deviceSize.width,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "room-details",
                                  arguments: property.id);
                            }),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                    autoPlay: false,
                    height: 200.0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.premiumProperty.map((url) {
            int index = widget.premiumProperty.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
