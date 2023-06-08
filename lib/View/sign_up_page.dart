import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/SignUpController.dart';

class SignUpPage extends GetView<SignUpController> {
  final SignUpController signUpController = Get.find<SignUpController>();
  @override
  SignUpPage({super.key});

  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, top: 99),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 63,
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0x00f2f2f2),
                        label: Text(
                          "Name",
                          style: TextStyle(fontSize: 11),
                        ),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0x00f2f2f2),
                        label: Text(
                          "Email",
                          style: TextStyle(fontSize: 11),
                        ),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0x00f2f2f2),
                        label: Text(
                          "Password",
                          style: TextStyle(fontSize: 11),
                        ),
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(logInPage);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Already have an account?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.yellow[800],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await controller.emailAndPasswordSignUP(
                      controller.emailController.text,
                      controller.passwordController.text,
                      controller.nameController.text);
                  Get.toNamed(navigationBarPage);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  height: 40,
                  color: Colors.yellow[800],
                  child: const Center(
                      child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 125,
            ),
            const Center(
                child: Text(
              "Or sign up with social account",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await signInController.googleSignIn();

                  },
                  child: Container(
                    width: 92,
                    height: 64,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(24)),
                    child: const Icon(Icons.g_mobiledata),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    await signInController.facebookLogin();
                  },
                  child: Container(
                    width: 92,
                    height: 64,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(24)),
                    child: const Icon(Icons.facebook),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
