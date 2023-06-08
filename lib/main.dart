import 'package:ecommerceapp/Core/Routes/Routes.dart';
import 'package:ecommerceapp/Core/Routes/route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SharedPreferences/PrefKeys.dart';
import 'SharedPreferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key,}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      onGenerateRoute: genrateRoute,
      initialRoute:_gotoRoute(),
    );
  }
  String _gotoRoute() {
    return UserPreference.getValue(key: PrefKeys.facebookToken) ?? false
        ? navigationBarPage
        : signUpPage;
  }
}




