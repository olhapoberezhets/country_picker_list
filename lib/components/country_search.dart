import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';
import 'package:provider/provider.dart';

class CountrySearch extends StatelessWidget {
  const CountrySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, countryData, child) {
        return Column(
          children: [
            SizedBox(
              height: 48.0.h,
              width: 335.0.w,
              child: TextField(
                onChanged: (value) => countryData.handleSearch(value),
                decoration: InputDecoration(
                  prefixIcon: Image.asset('assets/search.png'),
                  hintText: 'Search',
                  hintStyle: inactiveTextStyle16,
                  label: const Text('Search'),
                  labelStyle: activeTextStyle16,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16.0.r),
                  ),
                  filled: true,
                  fillColor: boxColor,
                ),
              ),
            ),
            SizedBox(height: 12.0.h),
          ],
        );
      },
    );
  }
}
