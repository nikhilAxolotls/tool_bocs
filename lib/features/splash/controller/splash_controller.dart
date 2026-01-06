// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tool_bocs/routes/app_routes.dart';

class SplashController extends ChangeNotifier {
  // Call this from Splash Screen
  Future<void> decideNavigation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2)); // splash delay

    // User logged in → check profile
    final bool isProfileCompleted = await _isProfileCompleted('userId');

    //if profile is completed then navigate to bottom navigation bar else navigate to login
    if (isProfileCompleted) {
      Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBar);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
    }
  }

  // Mock profile completion check
  Future<bool> _isProfileCompleted(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return false; // assume completed for now/ or login  before
  }
}
