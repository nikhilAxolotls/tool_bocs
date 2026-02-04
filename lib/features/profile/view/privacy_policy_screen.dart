import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1Color,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blackColor, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.openSans,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Divider(height: 1, color: Colors.grey.shade100),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('1. Information Collection'),
              _buildSectionContent(
                'We collect information you provide directly to us, such as when you create an account, post an item, or communicate with other users.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('2. Use of Information'),
              _buildSectionContent(
                'We use the information we collect to provide, maintain, and improve our services, including to facilitate transactions and communications between users.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('3. Information Sharing'),
              _buildSectionContent(
                'We do not share your private personal information with third parties except as described in this policy, such as when required by law.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('4. Data Security'),
              _buildSectionContent(
                'We take reasonable measures to protect your information from loss, theft, misuse, and unauthorized access.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('5. Your Choices'),
              _buildSectionContent(
                'You can update your account information and preferences at any time through the app settings.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('6. Contact Us'),
              _buildSectionContent(
                'If you have any questions about this Privacy Policy, please contact us through the Help & Support section.',
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Last Updated: February 2026',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: blackColor,
          fontFamily: FontFamily.openSans,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.grey.shade700,
        height: 1.5,
        fontFamily: FontFamily.openSans,
      ),
    );
  }
}
