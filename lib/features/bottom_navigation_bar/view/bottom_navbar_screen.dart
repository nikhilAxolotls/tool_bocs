import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/core/controller/shimmer_controller.dart';
import 'package:tool_bocs/features/home/view/home_screen.dart';
import 'package:tool_bocs/features/profile/view/profile_screen.dart';
import 'package:tool_bocs/features/trades/view/give_screen.dart';
import 'package:tool_bocs/features/trades/view/take_screen.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/features/chat/view/chat_list_screen.dart';
import '../controller/bottom_navbar_controller.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BottomNavBarController>();

    final List<Widget> screens = [
      const HomeScreen(),
      const GiveScreen(),
      const ChatListScreen(),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/give.svg',
              colorFilter: ColorFilter.mode(greyColor, BlendMode.srcIn),
            ), // Icon(Icons.card_giftcard_outlined),
            activeIcon: SvgPicture.asset(
              'assets/icons/give.svg',
              colorFilter: ColorFilter.mode(defoultColor, BlendMode.srcIn),
            ), // Icon(Icons.card_giftcard),
            label: 'Give',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/chat.svg',
              colorFilter: ColorFilter.mode(greyColor, BlendMode.srcIn),
            ), // Icon(Icons.chat_outlined),
            activeIcon: SvgPicture.asset(
              'assets/icons/chat.svg',
              colorFilter: ColorFilter.mode(defoultColor, BlendMode.srcIn),
            ), // Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/take.svg',
              colorFilter: ColorFilter.mode(greyColor, BlendMode.srcIn),
            ), // Icon(Icons.save_alt_outlined),
            activeIcon: SvgPicture.asset(
              'assets/icons/take.svg',
              colorFilter: ColorFilter.mode(defoultColor, BlendMode.srcIn),
            ), // Icon(Icons.save_alt),
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
