import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/view_model/detail_view_model.dart';
import 'package:movie_app/widget/base_widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  final data;
  final index;
  const DetailView({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    DetailViewModel viewModel;

    return ChangeNotifierProvider.value(
      value: viewModel = DetailViewModel(),
      builder: (context, child) {
        viewModel.textLength(data.data!.results![index].overview);
        return CustomScaffoldWidget(
          leading: IconButton(
            onPressed: () {},
            iconSize: viewModel.detailViewConsts.backIconSize,
            color: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_left),
          ),
          isHorizontalPadding: false,
          isViewBehindAppBar: true,
          widget: Column(
            children: [
              bannerWidget(viewModel, context),
              const SizedBox(
                height: 10,
              ),
              nameRateAndRelease(context, viewModel),
              const SizedBox(
                height: 25,
              ),
              detailAndDivider(viewModel, context)
            ],
          ),
        );
      },
    );
  }

  Padding detailAndDivider(DetailViewModel viewModel, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: viewModel.detailViewConsts.dividerPadding),
      child: Column(
        children: [
          //Divider about movie.

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: viewModel.detailViewConsts.dividerColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              infoBoxWidget(
                  context,
                  viewModel.releaseYear(data.data!.results![index].releaseDate),
                  viewModel),
              const SizedBox(
                width: 5,
              ),
              infoBoxWidget(context, "2h 13m", viewModel),
              const SizedBox(
                width: 5,
              ),
              infoBoxWidget(context, "+12", viewModel),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Divider(
                  color: viewModel.detailViewConsts.dividerColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          //Movie detail widget.

          Consumer<DetailViewModel>(
            builder: (context, value, child) {
              return viewModel.isMore
                  ? Row(
                      children: [
                        Text(
                          data.data!.results![index].overview.substring(0, 50) +
                              viewModel.detailViewConsts.moreText,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: viewModel
                                      .detailViewConsts.detailTextColor,
                                  height:
                                      viewModel.detailViewConsts.textHeight),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.changeTextLength();
                          },
                          child: Text(
                            viewModel.detailViewConsts.readMoreText,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: viewModel
                                        .detailViewConsts.readMoreColor,
                                    height:
                                        viewModel.detailViewConsts.textHeight),
                          ),
                        ),
                      ],
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.data!.results![index].overview,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Colors.white,
                                height: viewModel.detailViewConsts.textHeight),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }

  Column nameRateAndRelease(BuildContext context, DetailViewModel viewModel) {
    return Column(
      children: [
        //Movie name.

        Text(
          data.data!.results![index].title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: viewModel.detailViewConsts.titleColor,
              ),
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),

        //Movie release date.

        Text(
          viewModel.dateFormat(data.data!.results![index].releaseDate),
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: viewModel.detailViewConsts.dateColor),
        ),
        SizedBox(
          height: 10,
        ),

        //Vote average.

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBarIndicator(
              direction: Axis.horizontal,
              rating: data.data!.results![index].voteAverage / 2,
              itemCount: viewModel.detailViewConsts.starCount,
              itemPadding: EdgeInsets.symmetric(
                  horizontal: viewModel.detailViewConsts.starHorizontalPadding),
              itemBuilder: (context, _) => Icon(
                Icons.star_border_purple500,
                color: viewModel.detailViewConsts.starFillColor,
              ),
            ),
            Text(
              viewModel
                      .calculatedVoteAverage(
                          data.data!.results![index].voteAverage)
                      .toString() +
                  viewModel.detailViewConsts.maxRateText,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: viewModel.detailViewConsts.maxRateTextColor,
                  fontSize: viewModel.detailViewConsts.maxRateTextSize),
            )
          ],
        ),
      ],
    );
  }

  Container infoBoxWidget(
      BuildContext context, String text, DetailViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(viewModel.detailViewConsts.infoBoxRadius),
        border: Border.all(
          color: viewModel.detailViewConsts.infoBoxBorderColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                viewModel.detailViewConsts.infoBoxInfoTextPaddingHorizontal,
            vertical:
                viewModel.detailViewConsts.infoBoxInfoTextPaddingVertical),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: viewModel.detailViewConsts.infoBoxInfoTextColor),
        ),
      ),
    );
  }

  Container bannerWidget(DetailViewModel viewModel, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  viewModel.detailViewConsts.bannerBottomLeftRadius),
              bottomRight: Radius.circular(
                  viewModel.detailViewConsts.bannerBottomRightRadius)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(viewModel.baseConstants.sliderImagePath +
                  data.data!.results![index].posterPath))),
      height: viewModel.detailViewConsts.bannerHeight(context),
      width: double.infinity,
    );
  }
}
