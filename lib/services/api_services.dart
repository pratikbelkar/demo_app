import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static const String apiUrl = 'https://restcountries.com/v2/all';

  Future fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<Country> countrylist = [];
        final decodedData = jsonDecode(response.body);
        decodedData.forEach((e) => {
              countrylist.add(Country.fromJson(e)),
              log(countrylist.length.toString())
            });
        return countrylist;
      } else {
        throw Exception('Failed to load countries: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching countries: $e');
      rethrow; // Re-throw the exception to handle it further up the chain.
    }
  }
}

// Riverpod Provider for ApiService
final countryRepoProvider = Provider((ref) => ApiService());
