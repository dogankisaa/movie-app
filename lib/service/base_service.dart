import 'package:dio/dio.dart';
import 'package:movie_app/constants/service_constants.dart/base_constants.dart';

class HttpService {
  BaseConstants baseConstants = BaseConstants();
  Dio _dio = Dio();
  late var baseUrl = baseConstants.baseUrl;
  late var headers = {
      'Authorization': baseConstants.baseUrlAuth,
     
    };
  HttpService() {
  
    

    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
  }

  Future<Response> getRequest(String endPoint) async {
   
    Response response;
    try {
      response =
          await _dio.get(baseUrl + endPoint );
      print(baseUrl + endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> filteredGetRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
