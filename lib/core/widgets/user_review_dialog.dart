import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class UserReviewDialog extends StatefulWidget {
  const UserReviewDialog({super.key});

  @override
  State<UserReviewDialog> createState() => _UserReviewDialogState();
}

class _UserReviewDialogState extends State<UserReviewDialog> {
  int? _selectedFeedbackIndex;
  final TextEditingController _reviewController = TextEditingController();

  final List<Map<String, String>> _feedbackOptions = [
    {'emoji': '😊', 'label': 'Very friendly'},
    {'emoji': '👍', 'label': 'Good communication'},
    {'emoji': '⏱️', 'label': 'On time & smooth'},
    {'emoji': '😐', 'label': 'Average experience'},
    {'emoji': '👎', 'label': 'Very bad experience'},
  ];

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: 24.sp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'How was your experience\nwith this person?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                  fontFamily: FontFamily.openSans,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Feedback',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ...List.generate(_feedbackOptions.length, (index) {
                      final option = _feedbackOptions[index];
                      final isSelected = _selectedFeedbackIndex == index;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedFeedbackIndex = index;
                            });
                          },
                          borderRadius: BorderRadius.circular(30.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? themeColor.withOpacity(0.05)
                                  : Colors.blue.withOpacity(0.02),
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                color: isSelected
                                    ? themeColor
                                    : Colors.grey.shade100,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(option['emoji']!,
                                    style: TextStyle(fontSize: 14.sp)),
                                SizedBox(width: 8.w),
                                Text(
                                  option['label']!,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: isSelected ? themeColor : blackColor,
                                    fontFamily: FontFamily.openSans,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Optional Review',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                    fontFamily: FontFamily.openSans,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              TextField(
                controller: _reviewController,
                maxLines: 3,
                minLines: 2,
                decoration: InputDecoration(
                  hintText: 'Share details about your\nexperience',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontFamily: FontFamily.openSans,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: themeColor),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Submit Review',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.openSans,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
