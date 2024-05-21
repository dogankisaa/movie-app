
import 'package:dio/dio.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_popular_consts.dart';

import 'package:movie_app/model/popular_model.dart';

import 'package:movie_app/service/base_service.dart';

class GetPopular {
 Future<Popular> getPopular() async {
    GetPopularConstants getPopularConstants = GetPopularConstants();
    HttpService http = HttpService();
    Response response;

    response = await http.getRequest(getPopularConstants.getPopularPath);
    
   
if (response.statusCode == 200) {

   return Popular.fromJson(response.data);
   
  } else {
    
    throw Exception('Failed to load movis');
  }
    
  }
}