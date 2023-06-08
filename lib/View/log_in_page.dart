
import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends GetView<SignInController> {
   LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GlobalKey<FormState> fromKey = GlobalKey();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0, left: 16),
              child: Text(
                "Login ",
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required email Or Enter your Correct Email";
                          }
                        },
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xF2F2F2),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Password Or Enter Correct Password";
                          }
                        },
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xF2F2F2),
                            label: Text(
                              "Password",
                              style: TextStyle(fontSize: 11),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.yellow[800],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (fromKey.currentState!.validate()) {

                            try {
                              await auth.signInWithEmailAndPassword(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text);

                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                              // prefs.setBool('uid', true);

                              Get.toNamed(navigationBarPage);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("No user found for email")));
                                // print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Wrong password provided for that user.")));
                                //  print('Wrong password provided for that user.');
                              }
                            }
                          }
                          Get.toNamed(navigationBarPage);
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
                          GestureDetector(
                            onTap: () async {
                              await controller.googleSignIn();
                              Get.toNamed(navigationBarPage);
                            },
                            child: Container(
                              height: 64,
                              width: 92,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: const Icon(
                                Icons.g_mobiledata,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 64,
                            width: 92,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24)),
                            child: const Icon(
                              Icons.facebook,
                              size: 24,
                            ),
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
