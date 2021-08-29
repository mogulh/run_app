import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:run_app/auth/controllers/user_controller.dart';
import 'package:run_app/env.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController ctrl = Get.find();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Pallete.priAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "assets/images/light_brand.png",
            //   width: 100,
            // ),
            const SizedBox(
              height: 20,
            ),
            ReactiveForm(
                formGroup: ctrl.form,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white54),
                      child: ReactiveTextField(
                          formControlName: "username",
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Username',
                            hintText: "username",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white54),
                      child: ReactiveTextField(
                          formControlName: "password",
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            hintText: "password",
                            labelStyle: TextStyle(
                              color: Pallete.priAccent,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RoundedLoadingButton(
                        animateOnTap: false,
                        borderRadius: 8,
                        color: Pallete.secColor,
                        controller: ctrl.btnCtrl,
                        onPressed: () {
                          if (ctrl.form.valid) {
                            ctrl.login();
                          } else {
                            ctrl.form.markAllAsTouched();
                          }
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Pallete.priColor),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
