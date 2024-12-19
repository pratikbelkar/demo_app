import 'dart:typed_data';

import 'package:demo_app/models/country.dart';
import 'package:demo_app/providers/country_providers.dart';
import 'package:demo_app/screens/country_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Allcountry_screen extends ConsumerWidget {
  const Allcountry_screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Country>> allcountry = ref.watch(countryFutureProvider);
    return Scaffold(
      body: allcountry.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text('No countries available.'),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final country = data[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              CountryDetailsScreen(country: country)));
                    },
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          country.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              'Capital :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              country.capital.toString(),
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        leading: SvgPicture.network(
                          country.flag!,
                          width: 50,
                        ),

                        // leading: Image.network(
                        //   country.flag!,
                        //   width: 50,
                        // ),z
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('An error occurred: $error'),
        ),
      ),
    );
  }
}
