import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/Bloc/home_depart_bloc.dart';
// import 'package:path/path.dart';

import '../conf.dart';

class HomeCategories extends StatefulWidget {
  final String nxtPageRoute;
  HomeCategories(this.nxtPageRoute);
  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeDepartmentBloc>(context).add(DepartmentLoadEvent());
    BlocProvider.of<AuthBloc>(context).add(InitializeAuthEvent());
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
              ...(state.department).map(
                (depart) => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.nxtPageRoute == "/search") {
                            Navigator.pushNamed(context, "/search",
                                arguments: depart);
                          } else if (widget.nxtPageRoute ==
                              "/property_description") {
                            Navigator.pushNamed(
                                context, "/property_description",
                                arguments: depart);
                          }
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
                              depart.icon,
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
                        depart.name,
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
