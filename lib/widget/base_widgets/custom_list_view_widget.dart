import 'package:flutter/material.dart';
import 'package:movie_app/view/detail_view.dart';
import 'package:movie_app/view_model/main_view_model.dart';

class CustomListViewWidget extends StatelessWidget {
  final data;
  final poster;
  const CustomListViewWidget({super.key, this.data, this.poster});

  @override
  Widget build(BuildContext context) {
    var viewModel = MainViewModel();
    return SizedBox(
        height: viewModel.mainViewConsts.listViewHeight,
        width: double.infinity,
        child: ListView.builder(
          itemCount: data.data!.results.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: index != viewModel.mainViewConsts.listViewPadding2
                      ? viewModel.mainViewConsts.listViewPadding1
                      : viewModel.mainViewConsts.listViewPadding2),
              child: InkWell(
                onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                                data: data,
                                index: index,
                              )),
                    );
                },
                child: Container(
                  width: viewModel.mainViewConsts.listViewItemHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            viewModel.baseConstants.sliderImagePath +
                                data.data!.results![index].posterPath)),
                    borderRadius: BorderRadius.circular(
                        viewModel.mainViewConsts.listViewItemRadius),
                  ),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
