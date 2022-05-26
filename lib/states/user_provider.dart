import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_pref_keys.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    initUser();
  }

  User? _user;

  void initUser() {

    notifyListeners();
  }

  void _setNewUser(User? user) async {
    _user = user;
    if(user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String address = prefs.getString(SHARED_ADDRESS) ?? "";
      double lat = prefs.getDouble(SHARED_LAT) ?? 0;
      double lon = prefs.getDouble(SHARED_LON) ?? 0;
      String phoneNumber = user.phoneNumber!;
      String userKey = user.uid;
    }
  }


  bool _userLoggedIn = true;

  void setUserAuth(bool authState) {
    _userLoggedIn = authState;

  }

  bool get userState => _userLoggedIn;


}
