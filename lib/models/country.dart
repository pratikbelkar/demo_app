import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
@HiveType(typeId: 01)
class Country {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? alpha2Code;
  @HiveField(2)
  String? capital;
  @HiveField(3)
  String? region;
  @HiveField(4)
  String? subregion;
  @HiveField(5)
  int? population;
  @HiveField(6)
  String? flag;
  @HiveField(7)
  List<String>? timezones;
  @HiveField(8)
  List<String>? borders;
  @HiveField(9)
  List<dynamic>? currencies;
  @HiveField(10)
  List<dynamic>? languages;

  Country({
    this.name,
    this.alpha2Code,
    this.capital,
    this.region,
    this.subregion,
    this.population,
    this.flag,
    this.timezones,
    this.borders,
    this.currencies,
    this.languages,
  });
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
