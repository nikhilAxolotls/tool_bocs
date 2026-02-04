import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/routes/app_routes.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _gender = 'Male';
  bool _agreeToTerms = false;
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Image.asset(
                'assets/logo.png',
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(height: 32.h),
              Text(
                'Complete Your Profile',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: defoultColor,
                  fontFamily: FontFamily.openSans,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Just a few details to get started',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.subTextColor,
                  fontFamily: FontFamily.openSans,
                ),
              ),
              SizedBox(height: 32.h),
              _buildTextField(
                label: 'Full Name',
                hint: 'Enter Your Name',
                icon: Icons.person_outline,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                label: 'Date of Birth',
                hint: 'Select your date of birth',
                icon: Icons.calendar_today_outlined,
                controller: _dobController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _dobController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.textColor,
                    fontFamily: FontFamily.openSans,
                  ),
                ),
              ),
              Row(
                children: [
                  _buildRadioButton('Male'),
                  _buildRadioButton('Female'),
                  _buildRadioButton('Other'),
                ],
              ),
              SizedBox(height: 10.h),
              _buildTextField(
                label: 'Email Address',
                hint: 'you@example.com',
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                label: 'Location/Address',
                hint: 'New York, NY',
                icon: Icons.location_on_outlined,
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                    activeColor: defoultColor,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          color: context.subTextColor,
                          fontSize: 14.sp,
                          fontFamily: FontFamily.openSans,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms & Privacy Policy',
                            style: TextStyle(
                              color: defoultColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: defoultColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.openSans,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextEditingController? controller,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: context.textColor,
            fontFamily: FontFamily.openSans,
          ),
        ),
        SizedBox(height: 4.h),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: context.subTextColor,
              fontFamily: FontFamily.openSans,
            ),
            prefixIcon: Icon(icon, color: context.subTextColor, size: 20.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: context.dividerColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: context.dividerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: defoultColor),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: _gender,
          onChanged: (String? val) {
            setState(() {
              _gender = val!;
            });
          },
          activeColor: defoultColor,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: context.subTextColor,
            fontFamily: FontFamily.openSans,
          ),
        ),
      ],
    );
  }
}
