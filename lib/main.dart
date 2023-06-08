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
  final String? token = UserPreference.getValue(key: PrefKeys.facebookToken);
  runApp(MyApp(
    initRoute: token == null ? signUpPage : navigationPage,
  ));
}

class MyApp extends StatelessWidget {
  final String? initRoute;
  const MyApp({super.key, this.initRoute,});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      onGenerateRoute: genrateRoute,
      initialRoute: initRoute,
    );
  }
}
