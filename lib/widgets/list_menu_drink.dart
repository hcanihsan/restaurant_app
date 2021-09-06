import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_detail.dart';

class ListDrinkRestaurants extends StatelessWidget {
  final RestaurantDetail restaurant;
  ListDrinkRestaurants({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: restaurant.menus.drinks.length,
          itemBuilder: (context, i) {
            final itemDrink = restaurant.menus.drinks[i];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 7,
                          offset: Offset(0, 5))
                    ],
                    color: Colors.white,
                  ),
                  width: 200,
                  margin: EdgeInsets.only(right: 35),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2017/07/16/13/45/fresh-2509319_1280.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                        child: Text(
                          itemDrink.name,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
