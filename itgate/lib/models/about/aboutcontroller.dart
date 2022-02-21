import 'package:itgate/models/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AboutModel{

  String vision;
  String mission;
  String about;

  AboutModel(this.vision, this.mission, this.about);
}


mixin AboutController on Model{

  AboutModel? aboutModel;

  bool _isGetAboutLoading = false;
  bool get isGetAboutLoading => _isGetAboutLoading;


  Future<bool> getAboutData() async {

    _isGetAboutLoading = true;
    notifyListeners();

    try {
      http.Response _res = await http.get(Uri.parse('${Shared.domain}/getabout.php'));

      List _data = json.decode(_res.body);

      aboutModel = AboutModel(_data[0]['Vision'], _data[0]['Mission'], _data[0]['about']);

      _isGetAboutLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isGetAboutLoading = false;
      notifyListeners();
      return false;
    }
  }

}