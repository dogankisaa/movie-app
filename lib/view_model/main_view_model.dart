import 'package:movie_app/constants/service_constants.dart/base_constants.dart';
import 'package:movie_app/constants/main_view_consts.dart';
import 'package:movie_app/model/popular_model.dart';
import 'package:movie_app/model/trending_model.dart';
import 'package:movie_app/model/upcoming_model.dart';


import 'package:movie_app/service/get/get_popular.dart';
import 'package:movie_app/service/get/get_trending.dart';
import 'package:movie_app/service/get/get_upcoming.dart';
import 'package:movie_app/view_model/base_view_model.dart';

class MainViewModel extends BaseViewModel {
  late Future<Popular> movieData;
  late Future <Trending> trendingData;
  late Future <Upcoming> upcomingData;

  BaseConstants baseConstants = BaseConstants();
  MainViewConsts mainViewConsts = MainViewConsts();

  @override
  Future<void> init() async {
    upcomingData = GetUpcoming().getUpcoming();
    trendingData = GetTrending().getTrending();
    movieData = GetPopular().getPopular();
  }

 
}
