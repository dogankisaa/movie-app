import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/detail_view.dart';
import 'package:movie_app/widget/main_view_widgets/slider_image_widget.dart';

class SliderWidget extends StatelessWidget {
  final data;
  const SliderWidget({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
      items: <Widget>[
        for (var i = 0; i < data.data!.results!.length; i++)
          InkWell(
            onTap: () {
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DetailView(data: data, index: i,)),
              );
            },
            child: SliderImageWidget(data: data, i: i)),
      ],
    );
  }
}

