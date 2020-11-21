// import 'package:clay_containers/widgets/clay_containers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mero_kotha/Bloc/propertiesbloc.dart';
// import 'package:mero_kotha/conf.dart';
// import 'package:mero_kotha/model/department.dart';
// import 'package:mero_kotha/widgets/customAppbar.dart';
// import 'package:mero_kotha/widgets/imageSlider.dart';

// class RoomSearch extends StatefulWidget {
//   final Department departmentId;
//   RoomSearch(this.departmentId);
//   @override
//   _RoomSearchState createState() => _RoomSearchState();
// }

// class _RoomSearchState extends State<RoomSearch> {
//   ScrollController _scrollController;
//   @override
//   void initState() {
//     _scrollController = new ScrollController();
//     super.initState();
//     BlocProvider.of<PropertyDataBloc>(context).add(PropertyDataLoadEvent(widget.departmentId.id));
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: backgroundColor,
//       ),
//       child: Scaffold(
//         appBar: MyAppbar(preferredSize: Size.fromHeight(60.0)),
//         body: Container(
//           height: deviceSize.height,
//           width: deviceSize.width,
          
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   Expanded(child: BlocBuilder<PropertyDataBloc,PropertyDataStates>(
//                     builder: (_,state){
//                       if(state is PropertyDataLoadedState){
//                         return ListView.builder(
//                           itemCount: state.propeties.length,
//                           scrollDirection: Axis.vertical,
//                           itemBuilder: (_,index){
//                             final  property=state.propeties[index];
//                             return Card(
//                               margin: const EdgeInsets.all(10.0),
//                                                           child: ClayContainer(
//                                 height: 100.0,
//                                 child: ListTile(
//                                 //  leading:Image.network(property.photos[0])
//                                 ),

//                               ),
//                             );
//                           },
//                         );
//                       }
//                       return CircularProgressIndicator();
//                     },
//                   )),
//                  // ImageSlider(widget.departmentId),
//                   ],
//                 ),
              
//         ),
//       ),
//     );
//   }
// }
