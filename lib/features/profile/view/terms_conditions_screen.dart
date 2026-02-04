import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

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
          'Terms & Conditions',
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
              _buildSectionTitle('1. Acceptance of Terms'),
              _buildSectionContent(
                'By accessing and using Tool Bocs, you agree to be bound by these Terms and Conditions. If you do not agree, please do not use the application.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('2. User Registration'),
              _buildSectionContent(
                'Users must provide accurate information during registration. You are responsible for maintaining the confidentiality of your account credentials.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('3. Giving & Taking Policy'),
              _buildSectionContent(
                'Tool Bocs facilitates the exchange of items. Users are responsible for the accuracy of item descriptions and the safe handover of items.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('4. Prohibited Items'),
              _buildSectionContent(
                'Users may not list illegal, hazardous, or prohibited items as defined by local laws and our community guidelines.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('5. Limitation of Liability'),
              _buildSectionContent(
                'Tool Bocs is not responsible for the quality, safety, or legality of items exchanged. Users trade at their own risk.',
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('6. Modifications to Terms'),
              _buildSectionContent(
                'We reserve the right to modify these terms at any time. Continued use of the app constitutes acceptance of the updated terms.',
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
