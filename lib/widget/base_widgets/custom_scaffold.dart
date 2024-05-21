import 'package:flutter/material.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final widget;
  final action;
  final leading;
  final isViewBehindAppBar;
  final isHorizontalPadding;
  const CustomScaffoldWidget({
    super.key,
    required this.widget,
    this.action,
    this.leading,
    required this.isViewBehindAppBar,
    required this.isHorizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0, -1),
          end: Alignment(-1.0, 1),
          colors: <Color>[
            Color.fromRGBO(201, 4, 4, 1),
            Color.fromRGBO(0, 0, 0, 1),
            Color.fromRGBO(67, 7, 7, 1),
            Color.fromRGBO(0, 0, 0, 1),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isHorizontalPadding ? 20 : 0),
        child: Scaffold(
          extendBodyBehindAppBar: isViewBehindAppBar ? true : false,
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              leadingWidth: 30,
              leading: leading ?? const SizedBox(),
              actions: [action ?? const SizedBox()],
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          body: widget,
        ),
      ),
    );
  }
}
