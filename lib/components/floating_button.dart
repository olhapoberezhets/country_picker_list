import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, countryData, child) {
      return Ink(
        height: 48.0.h,
        width: 48.0.w,
        decoration: BoxDecoration(
          color: countryData.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(16.0.r)),
          boxShadow: [
            if (countryData.iconColor != inactiveColor)
              const BoxShadow(
                color: shadowColor,
                spreadRadius: 0.0,
                blurRadius: 12.0,
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: IconButton(
          onPressed: countryData.tapIconButton,
          icon: const Icon(
            Icons.arrow_forward,
          ),
          color: inactiveColor,
          splashColor: Colors.transparent,
        ),
      );
    });
  }
}
