import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/core/controller/shimmer_controller.dart';
import 'package:tool_bocs/core/controller/theme_controller.dart';
import 'package:tool_bocs/features/bottom_navigation_bar/controller/bottom_navbar_controller.dart';
import 'package:tool_bocs/features/chat/controller/chat_controller.dart';
import 'package:tool_bocs/features/splash/controller/on_bording_controller.dart';
import 'package:tool_bocs/firebase_options.dart';
import 'package:tool_bocs/util/connectivity_service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService().initialize();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
    debugPrint(
        "Please ensure you have added google-services.json (Android) or GoogleService-Info.plist (iOS)");
  }

  runApp(
    ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ShimmerController()), //shimmer controller
          ChangeNotifierProvider(create: (_) => ThemeController()),
          ChangeNotifierProvider(create: (_) => OnBoardingController()),
          ChangeNotifierProvider(create: (_) => BottomNavBarController()),

          ChangeNotifierProvider(create: (_) => ChatController()),
        ],
        child: const ToolBocsApp(),
      ),
      child: const SizedBox(), // prevent black screen
    ),
  );
}
