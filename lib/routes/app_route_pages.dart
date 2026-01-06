import 'package:flutter/material.dart';
import 'package:tool_bocs/features/bottom_navigation_bar/view/bottom_navbar_screen.dart';
import 'package:tool_bocs/features/chat/view/chat_screen.dart';
import 'package:tool_bocs/features/chat/view/dummy_chat_screen.dart';
import 'package:tool_bocs/features/home/view/home_screen.dart';
import 'package:tool_bocs/features/login_and_signup/view/login_screen.dart';
import 'package:tool_bocs/features/login_and_signup/view/otp_screen.dart';
import 'package:tool_bocs/features/login_and_signup/view/signup_screen.dart';
import 'package:tool_bocs/features/home/view/product_details_screen.dart';
import 'package:tool_bocs/features/splash/view/onbording_screen.dart';
import 'package:tool_bocs/features/splash/view/splash_screen.dart';
import 'package:tool_bocs/features/trades/view/create_give_post_screen.dart';

import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (_) => const SplashScreen(),
    AppRoutes.onBoarding: (_) => const OnBoardingScreen(),
    AppRoutes.login: (_) => LoginScreen(),
    AppRoutes.bottomNavBar: (_) => const BottomNavBarScreen(),
    AppRoutes.otp: (_) => const OtpScreen(),
    AppRoutes.home: (_) => const HomeScreen(),
    AppRoutes.chat: (_) => const ChatScreen(),
    AppRoutes.dummyChat: (_) => const DummyChatScreen(),
    AppRoutes.createGivePost: (_) => const CreateGivePostScreen(),
    AppRoutes.signUp: (_) => const SignUpScreen(),
    AppRoutes.productDetails: (_) => const ProductDetailsScreen(),
  };
}
