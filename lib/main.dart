import 'package:flutter/material.dart';
import 'package:nebulax_task1/Controllers/home_controller.dart';
import 'package:nebulax_task1/Utilities/Routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'Utilities/Routes/routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeController()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
