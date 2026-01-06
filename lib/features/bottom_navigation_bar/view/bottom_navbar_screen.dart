import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/core/controller/shimmer_controller.dart';
import 'package:tool_bocs/features/home/view/home_screen.dart';
import 'package:tool_bocs/features/profile/view/profile_screen.dart';
import 'package:tool_bocs/features/trades/view/give_screen.dart';
import 'package:tool_bocs/features/trades/view/take_screen.dart';
import 'package:tool_bocs/util/colors.dart';
import '../controller/bottom_navbar_controller.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BottomNavBarController>();

    final List<Widget> screens = [
      const HomeScreen(),
      const GiveScreen(),
      const TakeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.onPageChanged(index);
          // Optional: reset shimmer on page change
          context.read<ShimmerController>().reset();
        },
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.setIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defoultColor,
        unselectedItemColor: greyColor,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            activeIcon: Icon(Icons.card_giftcard),
            label: 'Give',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            activeIcon: Icon(Icons.handshake),
            label: 'Take',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
