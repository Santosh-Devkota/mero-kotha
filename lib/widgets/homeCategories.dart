import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/home_depart_bloc.dart';

import '../conf.dart';

class HomeCategories extends StatefulWidget {
  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeDepartmentBloc>(context).add(DepartmentLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDepartmentBloc, HomeDepartmentStates>(
        builder: (context, state) {
      if (state is DepartmentLoadedState) {
        return Expanded(
          child: GridView(
            padding: EdgeInsets.all(30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            children: [
              // Container()
              // ClayContainer(
              //   height: 150,
              //   width: 150,
              //   curveType: CurveType.none,
              //   color: baseColor,
              // ),
              // ClayContainer(
              //   height: 150,
              //   width: 150,
              //   curveType: CurveType.none,
              //   color: baseColor,
              // ),
              ...(state.department).map(
                (homeItem) => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/room_search");
                        },
                        child: ClayContainer(
                          height: 80,
                          width: 120,
                          curveType: CurveType.none,
                          color: baseColor,
                          child: Container(
                            // width: 80,
                            // height: 70,
                            alignment: Alignment.center,
                            child: Image.network(
                              homeItem.icon,
                              fit: BoxFit.fill,
                              height: 60,
                              width: 60,
                            ),
                          ),
                          borderRadius: 10.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        homeItem.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
