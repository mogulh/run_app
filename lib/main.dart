import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:run_app/auth/controllers/user_controller.dart';
import 'package:run_app/auth/screens/login.dart';
import 'package:run_app/auth/services/auth_service.dart';
import 'package:run_app/env.dart';
import 'package:run_app/runs/screens/home.dart';
import 'package:run_app/runs/screens/nav_scree.dart';

void main() async {
  await GetStorage.init();
  Get.lazyPut(() => AuthService());
  runApp(GetMaterialApp(
    initialRoute: "/login",
    theme: ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Pallete.priColor,
      buttonTheme: ButtonThemeData(
          buttonColor: Pallete.priColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    ),
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: "/login", page: () => const MyApp()),
      GetPage(name: "/", page: () => const NavScreen()),
    ],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loginState = GetStorage();

  @override
  void initState() {
    super.initState();

    loginState.writeIfNull("isLoggedIn", false);
    Future.delayed(Duration.zero, () {
      redirectLogin();
    });
  }

  void redirectLogin() {
    loginState.read("isLoggedIn")
        ? Get.offAllNamed("/")
        : Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    Get.put(UserController(), permanent: true);
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
