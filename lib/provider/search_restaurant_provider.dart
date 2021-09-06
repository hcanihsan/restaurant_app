import 'package:flutter/foundation.dart';

import 'package:restaurant_app/api/service_api.dart';

import 'package:restaurant_app/models/restaurant_search.dart';

enum StateResultSearch { Loading, NoData, HasData, Error }

class SearchRestaurantProvider extends ChangeNotifier {
  final ServiceAPI serviceAPISearch;

  SearchRestaurantProvider({required this.serviceAPISearch}) {
    fetchAllRestaurantSearch(query);
  }

  ResultRestaurantsSearch? _resultRestaurantsSearch;
  String _message = '';
  String _query = '';
  StateResultSearch? _state;

  String get message => _message;
  String get query => _query;

  ResultRestaurantsSearch? get result => _resultRestaurantsSearch;

  StateResultSearch? get state => _state;

  Future<dynamic> fetchAllRestaurantSearch(String query) async {
    try {
      _state = StateResultSearch.Loading;
      _query = query;

      final restaurantSearch =
          await serviceAPISearch.searchingRestaurant(query);
      if (restaurantSearch.restaurants.isEmpty) {
        _state = StateResultSearch.NoData;
        notifyListeners();
        return _message = 'Data Tidak Ditemukan :(';
      } else {
        _state = StateResultSearch.HasData;

        notifyListeners();
        return _resultRestaurantsSearch = restaurantSearch;
      }
    } catch (error) {
      _state = StateResultSearch.Error;
      notifyListeners();
      return _message = 'Sepertinya Ada Masalah :(';
    }
  }
}
