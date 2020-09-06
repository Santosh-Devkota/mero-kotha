import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:mero_kotha/widgets/neocontainer.dart';

import 'conf.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: NeoContainer(
          height: 56,
          width: MediaQuery.of(context).size.width,
          curveType: null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          NeoContainer(
            height: 150,
            width: 150,
            curveType: CurveType.concave,
          ),
          Expanded(
              child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              NeoContainer(height: 150, width: 150, curveType: CurveType.none),
              NeoContainer(height: 150, width: 150, curveType: CurveType.none),
              NeoContainer(height: 150, width: 150, curveType: CurveType.none),
              NeoContainer(height: 150, width: 150, curveType: CurveType.none),
            ],
          ))
        ],
      ),
    );
  }
}
