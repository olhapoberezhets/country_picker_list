import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group/components/country.dart';
import 'package:tbr_group/services/app_provider.dart';
import 'package:tbr_group/utilities/constants.dart';

class CountryListBuilder extends StatelessWidget {
  const CountryListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Country> filteredCountries = Provider.of<AppData>(context)
        .countries
        .where((country) =>
            country.name
                .toLowerCase()
                .contains(Provider.of<AppData>(context).query.toLowerCase()) ||
            (country.zoneCode + country.countryCode.first)
                .contains(Provider.of<AppData>(context).query))
        .toList();
    return Consumer<AppData>(builder: (context, countryData, child) {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: filteredCountries.length,
          itemBuilder: (context, index) {
            final country = filteredCountries[index];
            return ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0.w),
              visualDensity: const VisualDensity(vertical: -3),
              title: GestureDetector(
                onTap: () => countryData.onCountryTap(context, country),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24.0.w,
                      height: 19.0.h,
                      child: SvgPicture.network(
                        country.flag,
                      ),
                    ),
                    SizedBox(width: 16.0.w),
                    country.countryCode.isNotEmpty
                        ? Text(
                            '${country.zoneCode}${country.countryCode.first}',
                            style: activeTextStyle16,
                          )
                        : Text(country.zoneCode),
                    SizedBox(width: 12.0.w),
                    Flexible(
                      child: Text(
                        country.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle().copyWith(color: whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context, country);
              },
            );
          },
        ),
      );
    });
  }
}
