// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final int typeId = 1;

  @override
  Country read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Country(
      name: fields[0] as String?,
      alpha2Code: fields[1] as String?,
      capital: fields[2] as String?,
      region: fields[3] as String?,
      subregion: fields[4] as String?,
      population: fields[5] as int?,
      flag: fields[6] as String?,
      timezones: (fields[7] as List?)?.cast<String>(),
      borders: (fields[8] as List?)?.cast<String>(),
      currencies: (fields[9] as List?)?.cast<dynamic>(),
      languages: (fields[10] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.alpha2Code)
      ..writeByte(2)
      ..write(obj.capital)
      ..writeByte(3)
      ..write(obj.region)
      ..writeByte(4)
      ..write(obj.subregion)
      ..writeByte(5)
      ..write(obj.population)
      ..writeByte(6)
      ..write(obj.flag)
      ..writeByte(7)
      ..write(obj.timezones)
      ..writeByte(8)
      ..write(obj.borders)
      ..writeByte(9)
      ..write(obj.currencies)
      ..writeByte(10)
      ..write(obj.languages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
      alpha2Code: json['alpha2Code'] as String?,
      capital: json['capital'] as String?,
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
      population: (json['population'] as num?)?.toInt(),
      flag: json['flag'] as String?,
      timezones: (json['timezones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      borders:
          (json['borders'] as List<dynamic>?)?.map((e) => e as String).toList(),
      currencies: json['currencies'] as List<dynamic>?,
      languages: json['languages'] as List<dynamic>?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'alpha2Code': instance.alpha2Code,
      'capital': instance.capital,
      'region': instance.region,
      'subregion': instance.subregion,
      'population': instance.population,
      'flag': instance.flag,
      'timezones': instance.timezones,
      'borders': instance.borders,
      'currencies': instance.currencies,
      'languages': instance.languages,
    };
