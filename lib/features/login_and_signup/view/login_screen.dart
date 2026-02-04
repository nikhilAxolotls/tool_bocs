import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/routes/app_routes.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBg,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/logo.png',
                  width: 120.w,
                  height: 120.h,
                ),

                SizedBox(height: 60.h),

                // Login title
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.openSans,
                    color: defoultColor,
                  ),
                ),

                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  'Please Enter Your Phone Number',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontFamily.openSans,
                    color: context.subTextColor,
                  ),
                ),

                SizedBox(height: 30.h),

                // Phone input
                Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: context.dividerColor),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16.w),
                      Text(
                        '+91',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: context.subTextColor,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      VerticalDivider(
                        thickness: 1.w,
                        color: context.dividerColor,
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              fontSize: 16.sp, color: context.textColor),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                              10,
                            ), // max 10 digits
                            // remove leading zeros to prevent invalid phone numbers an also remove leading 91
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^91')),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: defoultColor,
                            //   ),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: defoultColor,
                            //   ),
                            // ),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 16.h),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontFamily.openSans,
                              color: context.subTextColor,
                            ),
                          ),
                          controller: _phoneController,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 75.h),

                // Get OTP button
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.otp,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: defoultColor,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Get OTP',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                            fontFamily: FontFamily.openSans,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                // Signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'or ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: context.subTextColor,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: defoultColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
