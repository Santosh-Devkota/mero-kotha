import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/propertiesbloc.dart';
import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/model/department.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/imageSlider.dart';

class Search extends StatefulWidget {
  final Department departmentId;
  Search(this.departmentId);
  @override
  _SearchSearchState createState() => _SearchSearchState();
}

class _SearchSearchState extends State<Search> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
    BlocProvider.of<PropertyDataBloc>(context).add(PropertyDataLoadEvent(widget.departmentId.id));
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
          
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Expanded(child: BlocBuilder<PropertyDataBloc,PropertyDataStates>(
                    builder: (_,state){
                      if(state is PropertyDataLoadedState){
                        return ListView.builder(
                          itemCount: state.propeties.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_,index){
                            final  property=state.propeties[index];
                            return Card(
                              margin: const EdgeInsets.all(10.0),
                                                          child: ClayContainer(
                                height: 100.0,
                                child: ListTile(
                                //  leading:Image.network(property.photos[0])
                                leading: Builder(
                                  builder:(_){
                                    if(property.photos.length>0){
                                      return Image.network(property.photos[0]);
                                    }
                                    return Icon(Icons.broken_image);
                                  }
                                ),
                                title: Text(property.location??"Unknown"),
                                trailing: property.hasInternet?Icon(Icons.wifi,color: Theme.of(context).accentColor,):Icon(Icons.wifi),
                                subtitle: Expanded(child: Column(
                                  children: [
                                    Text("${property.price.toStringAsFixed(0)} permonth"),
                                   // Text(property.phone[0])
                                  ],
                                )),
                                ),

                              ),
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  )),
                 // ImageSlider(widget.departmentId),
                  ],
                ),
              
        ),
      ),
    );
  }
}