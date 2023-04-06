import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group/components/country_picker_button.dart';
import 'package:tbr_group/components/floating_button.dart';
import 'package:tbr_group/components/phone_number_field.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AppData>(context, listen: false).getAllCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 80.0.h, left: 20.0.w, right: 11.0.w),
                child: Text('Get Started', style: textStyle32),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                child: Row(
                  children: [
                    const CountryPickerButton(),
                    SizedBox(width: 8.0.w),
                    const PhoneNumberField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
