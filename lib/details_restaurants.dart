import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/api/service_api.dart';
import 'package:restaurant_app/common/theme/styles.dart';

import 'package:restaurant_app/models/restaurant_detail.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/widgets/restaurants_list_detail.dart';

class DetailRestaurantsScreen extends StatelessWidget {
  final String id;
  DetailRestaurantsScreen({required this.id});

  Widget _restaurantsDetailsBuild() {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) =>
          DetailRestaurantProvider(serviceAPIDetail: ServiceAPI(), id: id),
      child: Consumer<DetailRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == StateResultDetail.Loading) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                  Text(
                    'Memuat Data Restoran...',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ));
          } else if (state.state == StateResultDetail.HasData) {
            return ListView(
              shrinkWrap: true,
              children: [
                RestaurantListDetail(
                  restaurant: state.result!.restaurant,
                )
              ],
            );
          } else if (state.state == StateResultDetail.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == StateResultDetail.Error) {
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
    return SafeArea(child: Scaffold(body: _restaurantsDetailsBuild()));
  }
}

//Photo Detail
class PhotoDetailRestaurant extends StatelessWidget {
  final RestaurantDetail restaurant;
  PhotoDetailRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
            imageProvider: NetworkImage(
                "https://restaurant-api.dicoding.dev/images/medium/" +
                    restaurant.pictureId)));
  }
}
