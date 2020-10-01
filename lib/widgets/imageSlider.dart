import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        // Container(
        //   width: deviceSize.width,
        //   height: 200.0,
        //   color: Colors.grey,
        //   child: Stack(
        //     alignment: Alignment.bottomRight,
        //     children: <Widget>[
        //       CarouselSlider.builder(
        //         itemCount: state.deals.length > 5 ? 5 : state.deals.length,
        //         itemBuilder: (context, index) {
        //           var deal = state.deals[index];
        //           if (deal.profileVideo == null) {
        //             return deal.profilePicture != null
        //                 ? CachedNetworkImage(
        //                     imageUrl: deal.profilePicture,
        //                     fit: BoxFit.cover,
        //                     width: deviceSize.width,
        //                   )
        //                 : Container();
        //           } else {
        //             return Container(
        //               height: 200.0,
        //               width: deviceSize.width,
        //               color: Colors.grey,
        //               child: Stack(
        //                 children: <Widget>[
        //                   deal.profilePicture != null
        //                       ? CachedNetworkImage(
        //                           imageUrl: deal.profilePicture,
        //                           fit: BoxFit.cover,
        //                           width: deviceSize.width,
        //                         )
        //                       : Container(),
        //                   Center(
        //                       child: IconButton(
        //                     iconSize: 60.0,
        //                     color: Colors.redAccent,
        //                     icon: Image.asset(
        //                       "assets/images/youtube.png",
        //                     ),
        //                     onPressed: () {

        //                       Navigator.pushNamed(context, "video-player",arguments:  deal.profileVideo);
        //                     },
        //                   )),
        //                 ],
        //               ),
        //             );
        //           }
        //         },
        //         options: CarouselOptions(
        //             autoPlay: false,
        //             height: 200.0,
        //             viewportFraction: 1.0,
        //             enlargeCenterPage: true,
        //             onPageChanged: (index, reason) {
        //               setState(() {
        //                 _current = index;
        //               });
        //             }),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.pushNamed(context, 'latest_deals');
        //         },
        //         child: Container(
        //           height: 25.0,
        //           width: 60.0,
        //           color: Theme.of(context).primaryColor,
        //           child: Center(
        //               child: Text(
        //             "All Deals",
        //             style: TextStyle(fontSize: 14.0, color: Colors.white),
        //           )),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: state.deals.map((url) {
        //     int index = state.deals.indexOf(url);
        //     return Container(
        //       width: 8.0,
        //       height: 8.0,
        //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: _current == index
        //             ? Theme.of(context).primaryColor
        //             : Color.fromRGBO(0, 0, 0, 0.4),
        //       ),
        //     );
        //   }).toList(),
        // ),
        Container()
      ],
    );
  }
}
