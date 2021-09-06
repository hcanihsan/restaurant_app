import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_detail.dart';

class ListReviews extends StatelessWidget {
  final RestaurantDetail restaurant;
  ListReviews({required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Review Pelanggan :',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        Container(
          height: 350,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: restaurant.customerReviews.length,
            itemBuilder: (context, i) {
              final itemReview = restaurant.customerReviews[i];
              return Container(
                margin:
                    EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 10),
                child: Stack(children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/01/09/11/11/office-594132_1280.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 59, top: 4),
                          child: Text(
                            itemReview.name,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            itemReview.date,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 59, top: 30),
                    child: Text(
                      itemReview.review,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
