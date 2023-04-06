import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tbr_group/components/country.dart';

class CountryService {
  Future<List<Country>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(
          'https://restcountries.com/v3.1/all?fields=name,flags,idd'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Country> countries = [];

        for (var c in data) {
          Country country = Country(
            flag: c['flags']['svg'],
            zoneCode: c['idd']['root'],
            countryCode: c['idd']['suffixes'],
            name: c['name']['common'],
          );

          if (country.flag.isNotEmpty &&
              country.zoneCode.isNotEmpty &&
              country.countryCode.isNotEmpty &&
              country.name.isNotEmpty &&

              /// I didn't add Belarus in this List because there's some problem with flag of this country. So it causes problem with selecting it and show on CountryPickerButton.
              country.flag != 'https://flagcdn.com/by.svg') {
            countries.add(country);
          }
        }

        return countries;
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }
}
