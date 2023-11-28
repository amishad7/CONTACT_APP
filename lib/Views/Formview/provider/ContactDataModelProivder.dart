import 'package:contact_app/Views/Formview/Model/ContactDataModel.dart';
import 'package:flutter/cupertino.dart';

class ContactDataProvider extends ChangeNotifier {
  List<ContactDataModel> allContacts = [];

  void createData({required ContactDataModel contactData}) {
    allContacts.add(contactData);
    notifyListeners();
  }

  void removeData({required ContactDataModel contactData}) {
    allContacts.remove(contactData);
    notifyListeners();
  }
}
