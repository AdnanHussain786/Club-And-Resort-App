import 'dart:ui';

import 'package:flutter/material.dart';

import '../Constants/const.dart';

class CustomBlurEffect extends StatelessWidget {//ignore: must_be_immutable

  CustomBlurEffect({
    super.key,
    this.showLoading=true
  });

  final double blurEffect = 2;
  bool? showLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurEffect, sigmaY: blurEffect),
        child: Container(
          color: Colors.transparent,
          child:
          showLoading!?
          const Center(
            child: CustomCircularProgressIndicator(),
          ):null,
        ),
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:
      CircularProgressIndicator(
        color: CustomAppColors.primaryColor,
      ),
    );
  }
}