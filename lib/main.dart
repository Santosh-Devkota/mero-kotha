import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            ),
          ),
          home: HomeScreen(),
        )));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: CustomDrawer(),
        // endDrawer: CustomDrawer(),
        backgroundColor: baseColor,
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(56),
        //   child: NeoContainer(
        //     height: 56,
        //     width: MediaQuery.of(context).size.width,
        //     curveType: null,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         IconButton(
        //           icon: Icon(Icons.menu),
        //           onPressed: () {},
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.space,
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
                //curveType: CurveType.convex,
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
              height: 130,
              width: 150,
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
            HomeCategories(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/login_signup");
                },
                child: ClayContainer(
                  child: FlatButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.add, size: 30.0, color: Color(0xFF193566)),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
