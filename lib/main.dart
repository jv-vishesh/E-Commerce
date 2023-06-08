import 'package:ecommerceapp/Controllers/SignInController.dart';
import 'package:ecommerceapp/Core/Routes/Routes.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/SignUpController.dart';
import 'SharedPreferences/PrefKeys.dart';
import 'SharedPreferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreference.initSharedPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      onGenerateRoute: genrateRoute,
      initialRoute: UserPreference.getValue(key: PrefKeys.facebookToken)==null ? signUpPage : navigationPage,
    );
  }
}
