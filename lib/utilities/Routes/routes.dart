import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nebulax_task1/Utilities/Routes/routes_name.dart';

import '../../Screens/home_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(body: Center(child: Text("No route defined")));
        });
    }
  }
}