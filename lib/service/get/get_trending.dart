
import 'package:dio/dio.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_trending_consts.dart';

import 'package:movie_app/model/trending_model.dart';

import 'package:movie_app/service/base_service.dart';

class GetTrending {
 Future<Trending> getTrending() async {
    GetTrendingConstants getTrendingConstants = GetTrendingConstants();
    HttpService http = HttpService();
    Response response;

    response = await http.getRequest(getTrendingConstants.getTrendingPath);
    
   
if (response.statusCode == 200) {

   return Trending.fromJson(response.data);
   
  } else {
    
    throw Exception('Failed to load movis');
  }
    
  }
}