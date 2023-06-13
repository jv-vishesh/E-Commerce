import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Widget/CustomSmallButtons.dart';
import '../Core/Widget/CustomTextfromfield.dart';

class LogInPage extends GetView<SignInController> {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> fromKey = GlobalKey();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0, left: 16),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 63,
            ),
            Form(
                key: fromKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Required email Or Enter your Correct Email";
                          }
                          return null;
                        },
                        label: "Email",
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0x00f2f2f2),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        obscuringCharacter: '*',
                        obscureText: true,
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Required Password Or Enter Correct Password";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(),
                        label: 'password',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Forgot your password?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.yellow[800],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (fromKey.currentState!.validate()) {
                            controller.signInValidate();
                          } else {
                            return;
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(color: Colors.yellow[800]),
                          child: const Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(signUpPage);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? SignUp",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.yellow[800],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 197,
                      ),
                      const Text(
                        "Or login with social account",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         SmallIconButton(
                           onTaps: ()async{
                             await controller.googleSignIn();
                           },
                           icons: const Icon(Icons.g_mobiledata),
                         ),
                          const SizedBox(
                            width: 16,
                          ),
                          SmallIconButton(
                            onTaps: () async {
                              await controller.facebookLogin();
                            },
                            icons: const Icon(Icons.facebook),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
