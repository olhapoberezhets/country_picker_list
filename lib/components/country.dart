class Country {
  final String flag;
  final String zoneCode;
  final List countryCode;
  final String name;

  Country({
    required this.flag,
    required this.zoneCode,
    required this.countryCode,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        flag: json['flag'],
        zoneCode: json['zoneCode'],
        countryCode: json['countryCode'],
        name: json['name'],
      );
}
