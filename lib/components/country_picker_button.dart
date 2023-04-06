import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';
import 'package:provider/provider.dart';

class CountryPickerButton extends StatelessWidget {
  const CountryPickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, countryData, child) {
        return GestureDetector(
          onTap: () => countryData.handleShowPicker(context),
          child: Container(
            height: 48.0.h,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24.0.w,
                      height: 19.0.h,
                      child:
                          SvgPicture.network(countryData.selectedCountry.flag),
                    ),
                    Text(
                      '  ${countryData.selectedCountry.zoneCode}${Provider.of<AppData>(context).selectedCountry.countryCode.first}',
                      style: activeTextStyle16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
