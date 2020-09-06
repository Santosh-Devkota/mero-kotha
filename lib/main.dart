import 'package:flutter/material.dart';

import 'conf.dart';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  onGenerateRoute: RouteGenerator.generateRoute,
  theme: ThemeData(
    primaryColor: Colors.indigo
  ),
  home: HomeScreen(),
));
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),
      
    );
  }
}