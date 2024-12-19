import 'dart:developer';

import 'package:demo_app/models/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class HiveRepo {
  final String _countrybox = 'countrybox';

  void registerHiveAdapter() {
    Hive.registerAdapter((CountryAdapter()));
  }

  Future addCountryToList(Country country) async {
    try {
      final countryBox = await Hive.openBox<Country>(_countrybox);
      if (countryBox.isOpen) {
        log('box is open');
        if (countryBox.containsKey(country.alpha2Code)) {
          throw Exception('pokemon aldredy added to favourites');
        }
        countryBox.put(country.alpha2Code, country);
      } else {
        return Future.error('failed to open box');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Country>> getFavouriteCountrylist() async {
    final countryBox = await Hive.openBox<Country>(_countrybox);
    return countryBox.values.toList();
  }

  Future RemoveCountryFromList(String counryalpha2code) async {
    final countryBox = await Hive.openBox<Country>(_countrybox);
    return countryBox.delete(counryalpha2code);
  }
}

final hiveProvider = Provider((ref) => HiveRepo());
