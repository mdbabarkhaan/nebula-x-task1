import 'package:flutter/material.dart';
import 'package:nebulax_task1/Controllers/home_controller.dart';
import 'package:nebulax_task1/api_services/status.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<HomeController>(
          create: (BuildContext context) => homeController,
          child: Consumer<HomeController>(
            builder: (context, value, child) {
              switch(value.wallpapersList.status){
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(child: Text(value.wallpapersList.message.toString()));
                case Status.COMPLETE:
                  return GridView.builder(
                    itemCount: value.wallpapersList.data!.photos!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 300, crossAxisSpacing: 5, mainAxisSpacing: 5
                  ), itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                              image: NetworkImage(value.wallpapersList.data!.photos![index].src!.small.toString()),
                            fit: BoxFit.cover
                          )
                      ),
                    );
                  },);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
