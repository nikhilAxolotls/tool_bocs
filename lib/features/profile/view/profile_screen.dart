import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/core/controller/shimmer_controller.dart';
import 'package:tool_bocs/core/widgets/shimmer_box.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shimmer = context.watch<ShimmerController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: shimmer.isLoading
          ? _buildShimmer(context)
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 15.h),
                        _buildBioSection(),
                        SizedBox(height: 15.h),
                        _buildReviewsSection(),
                        SizedBox(height: 15.h),
                        _buildTradeHistoryStats(),
                        SizedBox(height: 15.h),
                        _buildSettingsList(),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Shimmer
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: defoultColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            padding: EdgeInsets.fromLTRB(25.w, 80.h, 25.w, 40.h),
            child: Column(
              children: [
                Row(
                  children: [
                    ShimmerBox(height: 96.r, width: 96.r, radius: 48.r),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerBox(height: 24.h, width: 120.w),
                          SizedBox(height: 8.h),
                          ShimmerBox(height: 16.h, width: 150.w),
                          SizedBox(height: 12.h),
                          ShimmerBox(height: 32.h, width: 140.w, radius: 10.r),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                // Bio Section Shimmer
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(height: 20.h, width: 60.w),
                      SizedBox(height: 12.h),
                      ShimmerBox(height: 14.h, width: double.infinity),
                      SizedBox(height: 8.h),
                      ShimmerBox(height: 14.h, width: double.infinity),
                      SizedBox(height: 8.h),
                      ShimmerBox(height: 14.h, width: 200.w),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                // Reviews Section Shimmer
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 20.h, width: 140.w),
                          ShimmerBox(height: 16.h, width: 100.w),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          ShimmerBox(height: 50.r, width: 50.r, radius: 25.r),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerBox(height: 16.h, width: 100.w),
                                SizedBox(height: 8.h),
                                ShimmerBox(height: 12.h, width: 80.w),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                // Trade History Shimmer
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ShimmerBox(height: 20.h, width: 120.w),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                              child: ShimmerBox(
                                  height: 100.h,
                                  width: double.infinity,
                                  radius: 10.r)),
                          SizedBox(width: 16.w),
                          Expanded(
                              child: ShimmerBox(
                                  height: 100.h,
                                  width: double.infinity,
                                  radius: 10.r)),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      ShimmerBox(
                          height: 100.h, width: double.infinity, radius: 10.r),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                // Settings List Shimmer
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: List.generate(
                        5,
                        (index) => Column(
                              children: [
                                Row(
                                  children: [
                                    ShimmerBox(
                                        height: 24.h, width: 24.w, radius: 4.r),
                                    SizedBox(width: 16.w),
                                    ShimmerBox(height: 18.h, width: 150.w),
                                    const Spacer(),
                                    ShimmerBox(
                                        height: 16.h, width: 16.w, radius: 8.r),
                                  ],
                                ),
                                if (index < 4) ...[
                                  SizedBox(height: 12.h),
                                  Divider(
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.1)),
                                  SizedBox(height: 12.h),
                                ],
                              ],
                            )),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: defoultColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(25.w, 50.h, 25.w, 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.openSans,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.white, size: 16),
                label: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.openSans,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 48.r,
                    backgroundImage: const AssetImage('assets/profile1.png'),
                  ),
                  Positioned(
                    bottom: 2.h,
                    right: 6.w,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.camera_alt,
                          color: defoultColor, size: 16.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                    Text(
                      'Pune, Maharashtra',
                      style: TextStyle(
                        color: whiteColor.withOpacity(0.8),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.wallet, color: Colors.orange, size: 16.sp),
                          SizedBox(width: 4.w),
                          Text(
                            'Wallet Balance ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: FontFamily.openSans,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '₹120.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w900,
                              fontFamily: FontFamily.openSans,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bio',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.openSans,
              color: blackColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Entrepreneur | Passionate about sustainable living | Love connecting with people for meaningful exchanges. Always looking for unique items to give and take.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: greyColor,
              fontSize: 12.sp,
              height: 1.3,
              fontFamily: FontFamily.openSans,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews & Ratings',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    '4.8 (12 Reviews)',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildReviewItem(),
          const Divider(),
          _buildReviewItem(),
          const Divider(),
          _buildReviewItem(),
          SizedBox(height: 5.h),
          TextButton(
            onPressed: () {},
            child: Text(
              'Reviews & Ratings',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                fontFamily: FontFamily.openSans,
                color: defoultColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage('assets/profile1.png'),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rajesh Kumar',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.amber, size: 14.sp)),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Excellent service! The item was exactly as described and the handover was smooth.',
                  style: TextStyle(fontSize: 12.sp, color: greyColor),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.thumb_up_outlined,
                        size: 14.sp, color: greyColor),
                    SizedBox(width: 12.w),
                    Icon(Icons.thumb_down_outlined,
                        size: 14.sp, color: greyColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTradeHistoryStats() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Trade History',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.openSans,
                color: blackColor,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                  child: _buildStatCard(
                      'Total Gives', '35', Colors.red, Icons.card_giftcard)),
              SizedBox(width: 16.w),
              Expanded(
                  child: _buildStatCard(
                      'Total Takes', '28', Colors.orange, Icons.handshake)),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.1),
              border: Border.all(color: greyColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.handshake_outlined,
                        color: defoultColor, size: 28.sp),
                    SizedBox(height: 4.h),
                    Text(
                      '63',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: defoultColor),
                    ),
                    Text(
                      'Total Trades',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () {},
            child: Text(
              'View Trade History',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: defoultColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String label, String value, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.1),
        border: Border.all(color: greyColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28.sp),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w800,
              color: defoultColor,
              fontFamily: FontFamily.openSans,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: blackColor,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.openSans,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildSettingsItem(Icons.settings_outlined, 'Settings'),
          Divider(height: 1, color: greyColor.withOpacity(0.4), thickness: 1),
          _buildSettingsItem(Icons.wb_sunny_outlined, 'Theme'),
          Divider(height: 1, color: greyColor.withOpacity(0.4), thickness: 1),
          _buildSettingsItem(Icons.visibility_outlined, 'Visibility options'),
          Divider(height: 1, color: greyColor.withOpacity(0.4), thickness: 1),
          _buildSettingsItem(Icons.person_outline, 'Account Centre'),
          Divider(height: 1, color: greyColor.withOpacity(0.4), thickness: 1),
          _buildSettingsItem(Icons.messenger_outline, 'Report a Problem'),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.openSans,
          )),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: blackColor,
      ),
      onTap: () {},
    );
  }
}
