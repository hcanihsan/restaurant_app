import 'package:flutter/foundation.dart';
import 'package:restaurant_app/api/service_api.dart';
import 'package:restaurant_app/models/restaurant_list.dart';

enum StateResult { Loading, NoData, HasData, Error }

class ListRestaurantProvider extends ChangeNotifier {
  final ServiceAPI serviceAPIList;

  ListRestaurantProvider({required this.serviceAPIList}) {
    fetchAllRestaurants();
  }

  ResultRestaurantsList? _resultRestaurants;
  String _message = '';
  StateResult? _state;

  String get message => _message;

  ResultRestaurantsList? get result => _resultRestaurants;

  StateResult? get state => _state;

  Future<dynamic> fetchAllRestaurants() async {
    try {
      _state = StateResult.Loading;
      notifyListeners();
      final restaurant = await serviceAPIList.listRestaurant();
      if (restaurant.restaurants.isEmpty) {
        _state = StateResult.NoData;
        notifyListeners();
        return _message = 'Data Tidak Ditemukan :(';
      } else {
        _state = StateResult.HasData;
        notifyListeners();
        return _resultRestaurants = restaurant;
      }
    } catch (error) {
      _state = StateResult.Error;
      notifyListeners();
      return _message = 'Sepertinya Ada Masalah :(';
    }
  }
}
