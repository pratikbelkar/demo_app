import 'package:demo_app/models/country.dart';
import 'package:demo_app/services/api_services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryFutureProvider =
    FutureProvider.autoDispose<List<Country>>((ref) async {
  final countrylist = await ref.read(countryRepoProvider).fetchCountries();
  return countrylist;
});
