import 'package:flutter/material.dart';
import 'package:movie_app/view_model/main_view_model.dart';

class SliderImageWidget extends StatelessWidget {
  const SliderImageWidget({
    super.key,
    required this.data,
    required this.i,
  });

  final data;
  final int i;

  @override
  Widget build(BuildContext context) {
    var viewModel = MainViewModel();
    return Container(
      height: viewModel.mainViewConsts.sliderHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(viewModel.mainViewConsts.sliderRadius),
          image: sliderImage(viewModel)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: viewModel.mainViewConsts.sliderPaddingHorizontal, vertical: viewModel.mainViewConsts.sliderPaddingVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ageLimit(viewModel, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                movieTitle(viewModel, context),
                playButton(viewModel),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DecorationImage sliderImage(MainViewModel viewModel) {
    return DecorationImage(
            image: NetworkImage(viewModel.baseConstants.sliderImagePath +
                data.data!.results![i].backdropPath));
  }

  Container ageLimit(MainViewModel viewModel, BuildContext context) {
    return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(viewModel.mainViewConsts.sliderAgeRadius),
                color: viewModel.mainViewConsts.sliderImageAgeLimitBg),
            width: viewModel.mainViewConsts.sliderAgeLimitWidth,
            height: viewModel.mainViewConsts.sliderAgeLimitHeight,
            child: Center(
              child: Text(
                "+10",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: viewModel.mainViewConsts.sliderAgeTextColor),
              ),
            ),
          );
  }

  Container movieTitle(MainViewModel viewModel, BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                      color: viewModel.mainViewConsts.sliderImageMovieNameBg,
                      borderRadius: BorderRadius.circular(viewModel.mainViewConsts.sliderNameRadius)),
                  child: Padding(
                    padding:  EdgeInsets.all(viewModel.mainViewConsts.sliderNamePadding),
                    child: Text(
                      data.data!.results![i].title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: viewModel.mainViewConsts.sliderNameColor),
                    ),
                  ));
  }

  RawMaterialButton playButton(MainViewModel viewModel) {
    return RawMaterialButton(
                constraints:  BoxConstraints(minWidth: viewModel.mainViewConsts.sliderButtonMinWith),
                fillColor: viewModel.mainViewConsts.sliderImagePlayButtonBg,
                shape: const CircleBorder(),
                child:  Padding(
                  padding: EdgeInsets.all(viewModel.mainViewConsts.sliderButtonIconPadding),
                  child: Icon(
                    Icons.play_arrow,
                    color: viewModel.mainViewConsts.sliderButtonIconColor
                  ),
                ),
                onPressed: () {},
              );
  }
}
