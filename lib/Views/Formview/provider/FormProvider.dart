import 'package:contact_app/Views/Formview/Model/FormModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/Global.dart';

class FormProivder extends ChangeNotifier {
  FormModel f = FormModel(index: 0);
  ImagePicker picker = ImagePicker();

  void ContinueStep() {
    if (f.index != 3) {
      f.index++;
    }

    notifyListeners();
  }

  void CancelStep() {
    if (f.index != 0) {
      f.index--;
    }
    notifyListeners();
  }

  void pickImage() async {
    Global.img = await picker.pickImage(
      source: ImageSource.gallery,
    );
  }
}
