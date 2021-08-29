import 'dart:developer';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:run_app/auth/services/auth_service.dart';

class UserController extends GetxController {
  AuthService service = Get.find();
  final form = FormGroup({
    "username": FormControl<String>(validators: [Validators.required]),
    "password": FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)])
  });

  final btnCtrl = RoundedLoadingButtonController();

  @override
  void onInit() {
    if (service.isLoggedIn.value) {
      Get.toNamed("home");
    }
    super.onInit();
  }

  login() async {
    btnCtrl.start();
    var username = form.control("username").value;
    var password = form.control("password").value;

    try {
      await service.login(username, password);
      btnCtrl.success();
      Get.offAllNamed("/home");
    } catch (e) {
      log(e.toString());
      btnCtrl.error();
      Future.delayed(const Duration(seconds: 3), () => btnCtrl.reset());
    }
  }
}
