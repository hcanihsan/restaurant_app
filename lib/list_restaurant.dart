import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/theme/styles.dart';

import 'package:restaurant_app/provider/list_restaurant_provider.dart';
import 'package:restaurant_app/search_restaurant.dart';
import 'package:restaurant_app/widgets/restaurants_list_card.dart';

import 'api/service_api.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Widget _restaurantsListBuild() {
    return ChangeNotifierProvider(
      create: (_) => ListRestaurantProvider(serviceAPIList: ServiceAPI()),
      child: Consumer<ListRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == StateResult.Loading) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    minHeight: 5,
                    color: thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Memuat Data Restoran...',
                      style: Theme.of(context).textTheme.subtitle1)
                ],
              ),
            ));
          } else if (state.state == StateResult.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result!.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.result!.restaurants[index];
                return RestaurantsListCard(restaurant: restaurant);
              },
            );
          } else if (state.state == StateResult.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == StateResult.Error) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text(''));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchRestaurantScreen()));
                  },
                  icon: Icon(IconlyBroken.search)),
            ),
          ],
          title: Text(
            'Restaurant INDONESIA',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return new Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  height: 28.0,
                  left: 0.0,
                  right: 0.0,
                  child: connected
                      ? Visibility(
                          visible: true,
                          child: Container(),
                        )
                      : Container(
                          color: dangerColor,
                          child: Center(
                            child: Text(
                              "Koneksi Internet Kamu Hilang :(",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 30),
                        child: Text(
                          'Yuk, Cari Restoran Favorit Kamu Disini',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            height: MediaQuery.of(context).size.height,
                            child: _restaurantsListBuild()),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          child: Container(),
        ),
      ),
    );
  }
}
