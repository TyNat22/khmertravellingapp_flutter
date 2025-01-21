// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:network_state_management/model/place_model.dart'; // Keep only this if using package imports
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Place> _favorite = [];
  List<Place> get favorites => _favorite;

  void toggleFavorite(Place place) {
    if (_favorite.contains(place)) {
      _favorite.remove(place);
    } else {
      _favorite.add(place);
    }
    notifyListeners();
  }

  bool isExist(Place place) {
    final isExist = _favorite.contains(place);
    return isExist;
  }


  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
