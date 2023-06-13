import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/SignUpController.dart';
import '../Core/Widget/CustomSmallButtons.dart';
import '../Core/Widget/CustomTextfromfield.dart';

class SignUpPage extends GetView<SignUpController> {
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
                  CustomTextFormField(label: "Name",controller: controller.nameController,),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(label: "Email",controller: controller.emailController,),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    label: 'Password',
                    controller: controller.passwordController,
                    validators: (value) {
                      if (value!.isEmpty) {
                        return "Password Field is Empty";
                      }
                    },
                  )
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
                  await controller.emailAndPasswordSignUP();

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
                SmallIconButton(
                  onTaps: ()async{
                    await signInController.googleSignIn();
                  },
                  icons: const Icon(Icons.g_mobiledata),
                ),
                const SizedBox(
                  width: 16,
                ),
                SmallIconButton(
                  onTaps: () async {
                    await signInController.facebookLogin();
                  },
                  icons: const Icon(Icons.facebook),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
