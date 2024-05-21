
import 'package:dio/dio.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_upcoming_consts.dart';

import 'package:movie_app/model/upcoming_model.dart';

import 'package:movie_app/service/base_service.dart';

class GetUpcoming {
 Future<Upcoming> getUpcoming() async {
    GetUpcomingConstants getMoviesConstants = GetUpcomingConstants();
    HttpService http = HttpService();
    Response response;

    response = await http.getRequest(getMoviesConstants.getUpcomingPath);
    
   
if (response.statusCode == 200) {
  
   return Upcoming.fromJson(response.data);
   
  } else {
    
    throw Exception('Failed to load movis');
  }
    
  }
}