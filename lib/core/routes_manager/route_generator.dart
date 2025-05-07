import 'package:my_ecommerce/core/routes_manager/routes.dart';
import 'package:my_ecommerce/features/auth/ForgetPassword/presentation/pages/forget_password_screen.dart';
import 'package:my_ecommerce/features/auth/SignIn/presentation/pages/sign_in_screen.dart';
import 'package:my_ecommerce/features/auth/Signup/presentation/pages/sign_up_screen.dart';
import 'package:my_ecommerce/features/cart/cart/presentation/pages/cart_screen.dart';
import 'package:my_ecommerce/features/main_layout/main_layout.dart';
import 'package:my_ecommerce/features/product_details/presentation/screen/product_details.dart';
import 'package:my_ecommerce/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
