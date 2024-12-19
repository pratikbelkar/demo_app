import 'package:demo_app/models/country.dart';
import 'package:demo_app/repo/hive_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteCountry extends ConsumerStatefulWidget {
  const FavouriteCountry({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouriteCountryState();
}

class _FavouriteCountryState extends ConsumerState<FavouriteCountry> {
  final List<Country> countrylist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      await ref
          .read(hiveProvider)
          .getFavouriteCountrylist()
          .then((value) => setState(() {
                countrylist.addAll(value);
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: countrylist.isEmpty
            ? const Center(
                child: Text('No Favourite country'),
              )
            : ListView.builder(
                itemCount: countrylist.length,
                itemBuilder: (context, index) {
                  final Country country = countrylist[index];
                  return ListTile(
                    onTap: () {},
                    title: Text(country.name!),
                    subtitle: Text(country.capital.toString()),
                    leading: SvgPicture.network(
                      country.flag!,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          await ref
                              .read(hiveProvider)
                              .RemoveCountryFromList(country.alpha2Code!)
                              .then((value) {
                            setState(() {
                              countrylist.remove(country);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Country remove from favourites')));
                          }).catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'failed to remove country from favourites')));
                          });
                        },
                        icon: Icon(Icons.delete)),
                  );
                }));
  }
}
