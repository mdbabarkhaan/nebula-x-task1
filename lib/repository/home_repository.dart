import 'package:nebulax_task1/api_services/base_api_services.dart';
import 'package:nebulax_task1/api_services/network_api_services.dart';
import 'package:nebulax_task1/res/app_api_paths.dart';
import 'package:nebulax_task1/Models/wallpapers_model.dart';

class HomeRepository{
  final BaseApiServices _baseApiServices = NetworkApiService();

  Future<WallpapersModel> fetchMoviesList() async {
    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppApiUrls.baseurl);
      return response = WallpapersModel.fromJson(response);
    }catch(e){throw e;}
  }
}