import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/model/popular_model.dart';
import 'package:movie_app/service/get/get_trending.dart';

import 'package:movie_app/view_model/main_view_model.dart';
import 'package:movie_app/widget/base_widgets/custom_scaffold.dart';
import 'package:movie_app/widget/base_widgets/custom_list_view_widget.dart';
import 'package:movie_app/widget/main_view_widgets/slider_widget.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel;
    GetTrending().getTrending();
    return ChangeNotifierProvider.value(
        value: viewModel = MainViewModel(),
        builder: (context, child) => CustomScaffoldWidget(
          isHorizontalPadding: true,
          isViewBehindAppBar: false,
              leading: appBarLeading(viewModel),
              action: appBarActions(viewModel, context),
              widget: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(viewModel.mainViewConsts.welcomeText),
                    const SizedBox(
                      height: 22,
                    ),
                    slider(viewModel),
                    const SizedBox(
                      height: 20,
                    ),
                    listViewHeader(
                        context,
                        viewModel.mainViewConsts.listViewTrendingText,
                        viewModel.mainViewConsts.listViewSeeAllText,
                        viewModel),
                    const SizedBox(
                      height: 10,
                    ),
                    privateListViewWidget(viewModel.trendingData),
                    const SizedBox(
                      height: 20,
                    ),
                    listViewHeader(
                        context,
                        viewModel.mainViewConsts.listViewUpcomingText,
                        viewModel.mainViewConsts.listViewSeeAllText,
                        viewModel),
                    const SizedBox(
                      height: 10,
                    ),
                    privateListViewWidget(viewModel.upcomingData)
                  ],
                ),
              ),
            ));
  }

  FutureBuilder<Popular> slider(MainViewModel viewModel) {
    return FutureBuilder(
      future: viewModel.movieData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliderWidget(
            data: snapshot,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  FutureBuilder privateListViewWidget(viewModelData) {
    return FutureBuilder(
      future: viewModelData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomListViewWidget(data: snapshot);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Row listViewHeader(BuildContext context, String leading, String action,
      MainViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: viewModel.mainViewConsts.listViewLeadingColor,
                )),
        Text(
          action,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: viewModel.mainViewConsts.listVievActionColor),
        )
      ],
    );
  }

  Container appBarActions(MainViewModel viewModel, context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              viewModel.mainViewConsts.appBarActionsRadius),
          border: Border.all(
              color: viewModel.mainViewConsts.appBarActionsBorderColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: viewModel.mainViewConsts.appBarActionsPaddingHorizontal,
            vertical: viewModel.mainViewConsts.appBarActionsPaddingVertical),
        child: Center(
          child: Text(
            viewModel.mainViewConsts.appBarActionsText,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: viewModel.mainViewConsts.appBarActionsTextColor),
          ),
        ),
      ),
    );
  }

  SvgPicture appBarLeading(MainViewModel viewModel) {
    return SvgPicture.asset(viewModel.mainViewConsts.appBarLeadingLogoPath);
  }
}
