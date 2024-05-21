import 'package:flutter/material.dart';

class DetailViewConsts {
  double bannerBottomLeftRadius = 60;
  double bannerBottomRightRadius = 60;
  double backIconSize = 30;
  double starHorizontalPadding = 4;
  double maxRateTextSize = 25;
  double dividerPadding = 20;
  double textHeight = 2;
  double infoBoxRadius = 6;
  double infoBoxInfoTextPaddingHorizontal = 12;
  double infoBoxInfoTextPaddingVertical = 5;

  int starCount = 5;

  String maxRateText = " / 5";
  String moreText = "...";
  String readMoreText =   " Read More";

  Color titleColor = const Color.fromRGBO(255, 0, 0, 0.9);
  Color dateColor = const Color.fromRGBO(219, 219, 219, 1);
  Color starFillColor = const Color.fromRGBO(239, 80, 80, 1);
  Color maxRateTextColor = const Color.fromRGBO(197, 197, 197, 1);
  Color dividerColor = const Color.fromRGBO(197, 197, 197, 0.8);
  Color infoBoxBorderColor = const Color.fromRGBO(197, 197, 197, 0.8);
  Color readMoreColor = const Color.fromRGBO(239, 80, 80, 1);
  Color detailTextColor = Colors.white;
  Color infoBoxInfoTextColor = const Color.fromRGBO(219, 219, 219, 1);

  bannerHeight(context) {
    return MediaQuery.of(context).size.height * 0.5;
  }
}
