import 'package:flutter/material.dart';
import 'package:nebulax_task1/Models/wallpapers_model.dart';
import 'package:nebulax_task1/Repository/home_repository.dart';
import 'package:nebulax_task1/api_services/api_response.dart';

class HomeController extends ChangeNotifier {
  final _myRep = HomeRepository();

  ApiResponse<WallpapersModel> wallpapersList = ApiResponse.loading();

  setMoviesList(ApiResponse<WallpapersModel> response) {
    wallpapersList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRep.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
