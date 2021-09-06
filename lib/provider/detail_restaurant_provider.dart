import 'package:flutter/foundation.dart';
import 'package:restaurant_app/api/service_api.dart';
import 'package:restaurant_app/models/restaurant_detail.dart';

enum StateResultDetail { Loading, NoData, HasData, Error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ServiceAPI serviceAPIDetail;
  final String id;

  DetailRestaurantProvider({required this.serviceAPIDetail, required this.id}) {
    _fetchAllRestaurantDetail();
  }

  ResultRestaurantsDetail? _resultRestaurantsDetail;
  String _message = '';
  StateResultDetail? _state;

  String get message => _message;

  ResultRestaurantsDetail? get result => _resultRestaurantsDetail;

  StateResultDetail? get state => _state;

  Future<dynamic> _fetchAllRestaurantDetail() async {
    try {
      _state = StateResultDetail.Loading;
      notifyListeners();
      final restaurantDetail = await serviceAPIDetail.detailRestaurant(id);
      if (restaurantDetail.restaurant.id.isEmpty) {
        _state = StateResultDetail.NoData;
        notifyListeners();
        return _message = 'Data Tidak Ditemukan :(';
      } else {
        _state = StateResultDetail.HasData;
        notifyListeners();
        return _resultRestaurantsDetail = restaurantDetail;
      }
    } catch (error) {
      _state = StateResultDetail.Error;
      notifyListeners();
      return _message = 'Sepertinya Ada Masalah :(';
    }
  }
}
