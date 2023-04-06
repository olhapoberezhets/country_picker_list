import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tbr_group/components/country.dart';
import 'package:tbr_group/screens.dart/country_list_screen.dart';
import 'package:tbr_group/services/country_request.dart';

import 'package:tbr_group/utilities/constants.dart';

class AppData extends ChangeNotifier {
  Country selectedCountry = Country(
      flag: 'https://flagcdn.com/ua.svg',
      zoneCode: '+3',
      countryCode: [80],
      name: 'Ukraine');

  String _query = '';
  Country? _country;
  List<Country> _countries = [];
  final numberMaskFormatter = MaskTextInputFormatter(mask: '(###) ###-####');

  final TextEditingController numberController = TextEditingController();

  final _service = CountryService();

  Color _buttonColor = boxColor;
  Color _iconColor = inactiveColor;
  void Function() _tapIconButton = () {};

  String get query => _query;
  Country? get country => _country;
  UnmodifiableListView<Country> get countries {
    return UnmodifiableListView(_countries);
  }

  Color get buttonColor => _buttonColor;
  Color get iconColor => _iconColor;
  void Function() get tapIconButton => _tapIconButton;

  void handleShowPicker(BuildContext context) async {
    final country = await showCupertinoModalBottomSheet(
        context: context,
        barrierColor: Colors.black,
        builder: (context) => const CountryListScreen());
    if (country != null) {
      selectedCountry = country;
    }

    notifyListeners();
  }

  void tapPhoneNumber(value) {
    if (value.length >= 14) {
      _buttonColor = whiteColor;
      _iconColor = activeColor;
      _tapIconButton = () {
        print('Button was tapped');
      };
      notifyListeners();
    } else {
      _buttonColor = boxColor;
      _iconColor = inactiveColor;
      _tapIconButton = () {};
      notifyListeners();
    }
  }

  void handleSearch(String value) {
    _query = value;
    notifyListeners();
  }

  void onCountryTap(BuildContext context, Country country) {
    Navigator.pop(context, country);
    _query = '';
    notifyListeners();
  }

  Future<void> getAllCountries() async {
    final response = await _service.fetchCountries();
    _countries = response;

    notifyListeners();
  }
}
