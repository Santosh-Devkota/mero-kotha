import 'dart:async';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/Bloc/home_depart_bloc.dart';
import 'package:mero_kotha/Bloc/room_slider_bloc.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';
import 'package:mero_kotha/widgets/homeCategories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'conf.dart';

void main() => runApp(MultiBlocProvider(
        providers: [
          BlocProvider<HomeDepartmentBloc>(
              create: (BuildContext context) =>
                  HomeDepartmentBloc(DepartmentInitialState())),
          BlocProvider<RoomSliderBloc>(
            create: (BuildContext context) =>
                RoomSliderBloc(SliderInitialState()),
          ),
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(AuthNotLoggedInState()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            // hintColor: backgroundColor,
            primaryColor: Color(0xFF193566),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: backgroundColor,
                size: 30,
              ),
            ),
            iconTheme: IconThemeData(
              color: backgroundColor,
              size: 30,
            ),

            textTheme: TextTheme(
                bodyText1: GoogleFonts.roboto(
                    fontSize: 22.0, color: Color(0xFF193566), letterSpacing: 1),
                bodyText2: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Color(0xFF193566),
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                )),
          ),
         home: HomeScreen(),
      
        )));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String nextRoute = "/property_search";
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: CustomDrawer(),
        backgroundColor: baseColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
              ),
              color: baseColor,
              alignment: Alignment.centerRight,
              child: ClayContainer(
                height: 50,
                width: 50,
                depth: 100,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 35.0,
                  onPressed: () {
                    _key.currentState.openDrawer();
                  },
                ),
                //  color: baseColor,
                borderRadius: 15,
                color: baseColor,
              ),
            ),
            ClayContainer(
              height: 120,
              width: 140,
              curveType: CurveType.concave,
              color: baseColor,
              child: Center(
                child: Image.asset(
                  "assets/images/brandlogo.png",
                  height: 100,
                  width: 100,
                ),
              ),
              emboss: true,
              borderRadius: 15,
            ),
            HomeCategories(nextRoute),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<AuthBloc, AuthStates>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (state is AuthLoggedInState) {
                        Navigator.pushNamed(context, "/property_selection");
                      } else {
                        Navigator.pushNamed(context, "/login_signup");
                      }
                    },
                    child: ClayContainer(
                      child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.add,
                            size: 30.0, color: Color(0xFF193566)),
                        label: Text(
                          "Add New",
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            //color: .white,
                            color: Color(0xFF193566),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void pageAction({String departmentName, String departId, BuildContext ctx}) {
    Navigator.pushNamed(context, "/${departmentName}_search",
        arguments: departId);
  }
}
