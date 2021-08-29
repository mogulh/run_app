import 'dart:convert';

import 'package:get/get.dart';
import 'package:run_app/env.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetConnect {
  String url = BASEURL;
  var isLoggedIn = false.obs;

  Future login(username, password) async {
    var resp = await post(url + "login/",
        json.encode({"username": username, "password": password}));

    if (resp.isOk) {
      var key = resp.body["key"];
      GetStorage().write("token", key);
      isLoggedIn(true);
    } else {
      return Future.error(resp);
    }
  }
}
