import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, countryData, child) {
      return Expanded(
        child: SizedBox(
          height: 48.0.h,
          width: 256.0.w,
          child: TextField(
            onChanged: (value) => countryData.tapPhoneNumber(value),
            cursorHeight: 20.0.h,
            style: activeTextStyle16,
            keyboardType: TextInputType.number,
            controller: countryData.numberController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.0.h,
                horizontal: 12.0.w,
              ),
              hintText: 'Your phone number',
              hintStyle: inactiveTextStyle16,
              filled: true,
              fillColor: boxColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0.r),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            inputFormatters: [countryData.numberMaskFormatter],
          ),
        ),
      );
    });
  }
}
