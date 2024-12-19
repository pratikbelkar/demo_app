import 'package:demo_app/repo/hive_repo.dart';
import 'package:demo_app/widget/country_details_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/country.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  const CountryDetailsScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 70, 192),
      appBar: AppBar(
        actions: [
          Consumer(builder: (context, ref, child) {
            return IconButton(
                onPressed: () async {
                  await ref
                      .read(hiveProvider)
                      .addCountryToList(country)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('country added to the favourites'),
                      ),
                    );
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$e'),
                      ),
                    );
                  });
                },
                icon: Icon(Icons.favorite));
          })
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(country.name!),
                Text(country.alpha2Code!),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height * 0.57,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 246, 248),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Country details :',
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      CountryDetailsRow(title: 'Name', value: country.name!),
                      CountryDetailsRow(
                          title: 'Capital', value: country.capital.toString()),
                      CountryDetailsRow(
                          title: 'population',
                          value: country.population.toString()),
                      CountryDetailsRow(
                          title: 'country region', value: country.region!),
                      CountryDetailsRow(
                          title: 'hash code',
                          value: country.hashCode.toString()),
                      CountryDetailsRow(
                          title: 'Borders', value: country.borders.toString())
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: height * 0.11,
              left: (width / 1) - 290,
              child: SvgPicture.network(
                country.flag!,
                height: 100,
                width: 150,
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
