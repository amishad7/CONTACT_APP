import 'package:contact_app/Views/ProfileView/Model/FavDataModel.dart';
import 'package:flutter/cupertino.dart';

class FavDataProvider extends ChangeNotifier {
  FavDataModel f = FavDataModel(isFavourite: false);

  void addInFav() {
    f.isFavourite = !f.isFavourite;
    notifyListeners();
  }
}
