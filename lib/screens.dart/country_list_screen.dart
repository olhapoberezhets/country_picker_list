import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tbr_group/components/background_container.dart';
import 'package:tbr_group/components/country_list_builder.dart';
import 'package:tbr_group/components/country_search.dart';
import 'package:tbr_group/utilities/constants.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BackgroundContainer(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 20.0.h, left: 20.0.w, right: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Country List',
                    style: textStyle32,
                  ),
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset('assets/close_icon.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0.h),
            const CountrySearch(),
            const CountryListBuilder()
          ],
        ),
      ),
    );
  }
}
