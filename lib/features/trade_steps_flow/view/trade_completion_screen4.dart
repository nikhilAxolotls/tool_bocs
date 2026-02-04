import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';
import 'package:tool_bocs/routes/app_routes.dart';

class TradeCompletionScreen extends StatelessWidget {
  const TradeCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1Color,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStepper(),
                SizedBox(height: 10.h),
                _buildHandshakeBanner(),
                SizedBox(height: 24.h),
                _buildTradeSummary(),
                SizedBox(height: 16.h),
                _buildChatTicketCard(context),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomAction(context),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, color: blackColor, size: 20.sp),
      ),
      centerTitle: true,
      title: Text(
        'Complete the Trade',
        style: TextStyle(
          color: blackColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.openSans,
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          _buildStepSegment(isActive: true),
          _buildStepSegment(isActive: true),
          _buildStepSegment(isActive: true),
        ],
      ),
    );
  }

  Widget _buildStepSegment({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 5.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          color: isActive ? defoultColor : greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  Widget _buildHandshakeBanner() {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Image.asset(
        'assets/TradeAccepted.png', // Fallback for now
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,

        colorBlendMode: BlendMode.dstIn,
      ),
    );
  }

  Widget _buildTradeSummary() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: const Color(0xFF475467),
            fontSize: 16.sp,
            fontFamily: FontFamily.openSans,
            height: 1.5,
          ),
          children: [
            const TextSpan(
              text: 'Rohan ',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Color(0xFF1E61CC)),
            ),
            const TextSpan(text: 'accepted your offer -\n'),
            const TextSpan(text: 'Taking Icecream from you, Giving you\n'),
            const TextSpan(
              text: 'Money ',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Color(0xFF2D2D2D)),
            ),
            const TextSpan(text: 'in return'),
          ],
        ),
      ),
    );
  }

  Widget _buildChatTicketCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.dummyChat);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F0FF),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.chat_bubble_outline,
                  color: const Color(0xFF1E61CC), size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chat with Rohan',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    'Spend a Ticket (15 mtrs)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,
                color: const Color(0xFF2D2D2D), size: 18.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.tradeSuccess);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF215BA3),
          minimumSize: Size(double.infinity, 54.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          elevation: 0,
        ),
        child: Text(
          'Close Trade',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
