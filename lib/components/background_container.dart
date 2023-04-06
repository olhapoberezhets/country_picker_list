import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tbr_group/utilities/constants.dart';

class BackgroundContainer extends StatelessWidget {
  Widget child;

  BackgroundContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 768.0.h,
          width: 343.0.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff6e98bc),
                Color(0xff7778c3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0.r),
              topRight: Radius.circular(12.0.r),
            ),
          ),
        ),
        Container(
          height: 742.0.h,
          width: 375.0.w,
          decoration: BoxDecoration(
            color: appColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0.r),
              topRight: Radius.circular(24.0.r),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
