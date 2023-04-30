import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLodaing(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLodaing(true);
    try {
      Response res = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (res.statusCode == 200) {
        setLodaing(false);
        print('a');
      } else {
        setLodaing(false);
        print('f');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
