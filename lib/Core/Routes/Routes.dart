import 'package:ecommerceapp/Bindings/NavigationBinding.dart';
import 'package:ecommerceapp/Bindings/SignInPageBindings.dart';
import 'package:ecommerceapp/Bindings/SignUpBindings.dart';
import 'package:ecommerceapp/View/AddProductsPage.dart';
import 'package:ecommerceapp/View/BottomNavigationBar.dart';
import 'package:ecommerceapp/View/UserProfilePage.dart';
import 'package:ecommerceapp/View/ViewProductPage.dart';
import 'package:ecommerceapp/View/home_page.dart';
import 'package:ecommerceapp/View/log_in_page.dart';
import 'package:ecommerceapp/View/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Bindings/HomePageBindings.dart';
import '../../Bindings/ProfilePageBindings.dart';
import 'route_name.dart';

Route<dynamic>? genrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case logInPage:
      return GetPageRoute(
          routeName: logInPage,
          settings: settings,
          page: () =>  LogInPage(),
          binding: SignInPageBindings());
    case signUpPage:
      return GetPageRoute(
          routeName: signUpPage,
          settings: settings,
          page: ()=>SignUpPage(),
          binding: SignUpBinding());

    case homePage:
      return GetPageRoute(
        routeName: homePage,
        settings: settings,
        page: () => const HomePage(),
        binding: HomepageBindings()
      );
    case navigationPage:
      return GetPageRoute(
          routeName: navigationPage,
          settings: settings,
          page: ()=>BottomNavigationBarPage(),
          binding: NavigationBarBinding()
      );
    case addProductPage:
      return GetPageRoute(
          routeName: addProductPage,
          settings: settings,
          page: () => const AddProductPage());
    case userProfilePage:
      return GetPageRoute(
        routeName: userProfilePage,
        settings: settings,
        page: ()=> UserProfilePage(),
          binding: ProfilePageBinding()
      );
    case viewProductPage:
      return GetPageRoute(
        routeName: viewProductPage,
        settings: settings,
        page: ()=>ViewProductPage()
      );
    default:
      return GetPageRoute(
        page: () => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
