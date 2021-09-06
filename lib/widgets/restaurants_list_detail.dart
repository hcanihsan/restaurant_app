import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:restaurant_app/common/theme/styles.dart';
import 'package:restaurant_app/models/restaurant_detail.dart';
import 'package:restaurant_app/widgets/list_review.dart';
import 'package:restaurant_app/widgets/list_menu_drink.dart';
import 'package:restaurant_app/widgets/list_menu_food.dart';

import '../details_restaurants.dart';

class RestaurantListDetail extends StatelessWidget {
  final RestaurantDetail restaurant;
  RestaurantListDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 290,
                      child: Stack(
                        children: [
                          Hero(
                              tag: restaurant.pictureId,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PhotoDetailRestaurant(
                                                restaurant: restaurant),
                                      ));
                                },
                                child: Container(
                                  height: 290,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://restaurant-api.dicoding.dev/images/medium/" +
                                                  restaurant.pictureId),
                                          fit: BoxFit.fill)),
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25))),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  IconlyBroken.arrowLeft2,
                                  size: 28,
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                color: primaryColor,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.star,
                                        color: ratingColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        "${restaurant.rating}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 18),
                      child: Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 18),
                      child: Text("Kategori :",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Container(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: restaurant.categories.map((e) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: primaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          bottom: 8,
                                          top: 8),
                                      child: Text(
                                        e.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 18),
                      child: Text("Alamat :",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 18),
                      child: Text("Deskripsi :",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Text(
                        restaurant.description,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),

                    // List Menu
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 18, bottom: 10),
                      child: Text("Menu Makanan :",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    ListFoodRestaurants(restaurant: restaurant),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 18, bottom: 10),
                      child: Text("Menu Minuman :",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    ListDrinkRestaurants(restaurant: restaurant),
                    SizedBox(
                      height: 25,
                    ),
                    //List Menu
                    Divider(
                      thickness: 2,
                    ),
                    ListReviews(restaurant: restaurant),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  child: connected
                      ? Visibility(
                          visible: true,
                          child: Container(),
                        )
                      : Container(
                          color: dangerColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "Koneksi Internet Kamu Hilang :(",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(),
    );
  }
}
