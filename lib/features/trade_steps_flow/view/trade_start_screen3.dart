import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';
import 'package:tool_bocs/routes/app_routes.dart';

class TradeStartScreen extends StatefulWidget {
  const TradeStartScreen({super.key});

  @override
  State<TradeStartScreen> createState() => _TradeStartScreenState();
}

class _TradeStartScreenState extends State<TradeStartScreen> {
  String _selectedMeetingPreference = 'Come to me';
  bool _isAcceptSelected = true;
  bool _showMoreDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1Color,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Column(
              children: [
                _buildStepper(),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTradeBegunCard(),
                      SizedBox(height: 24.h),
                      Text(
                        'Meeting Preferences',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: FontFamily.openSans,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Accept the offer and choose a handover location',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _buildAcceptRejectSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomAction(),
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
        'Trade Request',
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
      padding: EdgeInsets.only(bottom: 10.h, left: 2.w, right: 2.w),
      child: Row(
        children: [
          _buildStepSegment(isActive: true),
          _buildStepSegment(isActive: true),
          _buildStepSegment(isActive: true),
          _buildStepSegment(isActive: false),
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

  Widget _buildTradeBegunCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Trade has Begun !',
                      style: TextStyle(
                        color: defoultColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 16.sp,
                                  fontFamily: FontFamily.openSans,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Riya ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF2D2D2D)),
                                  ),
                                  const TextSpan(text: 'responded :\n'),
                                  const TextSpan(
                                      text: 'Giving you Icecream -\nTaking '),
                                  TextSpan(
                                    text: 'Money ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF2D2D2D)),
                                  ),
                                  const TextSpan(text: 'in return'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () => setState(
                                  () => _showMoreDetails = !_showMoreDetails),
                              child: Text(
                                _showMoreDetails
                                    ? 'Less Details'
                                    : 'More Details',
                                style: TextStyle(
                                  color: defoultColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            //SizedBox(height: 20.h),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/iphone.png'), // Placeholder
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_showMoreDetails) ...[
                      SizedBox(height: 16.h),
                      _buildItemDetailMiniCard(),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemDetailMiniCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade50),
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: const DecorationImage(
                image: AssetImage('assets/iphone.png'), // Placeholder
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1L Vailla Icecream',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: blackColor,
                  ),
                ),
                Text(
                  'Homemade',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: defoultColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: greyColor,
                      fontFamily: FontFamily.openSans,
                    ),
                    children: const [
                      TextSpan(text: 'Category : '),
                      TextSpan(
                          text: 'Other',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: defoultColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'Item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptRejectSection() {
    return Column(
      children: [
        _buildInteractionCard(
          isSelected: _isAcceptSelected,
          onTap: () => setState(() => _isAcceptSelected = true),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Accept Offer (Notify Riya)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.openSans,
                      color: blackColor,
                    ),
                  ),
                  _buildRadioButton(isActive: _isAcceptSelected),
                ],
              ),
              if (_isAcceptSelected) ...[
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPreferenceChip('Come to me'),
                    _buildPreferenceChip('I Pick Up'),
                    _buildPreferenceChip('Centre Point'),
                  ],
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _buildInteractionCard(
          isSelected: !_isAcceptSelected,
          onTap: () => setState(() => _isAcceptSelected = false),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reject Offer',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.openSans,
                  color: blackColor,
                ),
              ),
              _buildRadioButton(isActive: !_isAcceptSelected),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractionCard(
      {required bool isSelected,
      required Widget child,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF1F6FF) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? defoultColor.withOpacity(0.1)
                : Colors.grey.shade100,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildRadioButton({required bool isActive}) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? defoultColor : greyColor.withOpacity(0.3),
          width: 2.w,
        ),
      ),
      child: isActive
          ? Center(
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: defoultColor,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildPreferenceChip(String label) {
    bool isSelected = _selectedMeetingPreference == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedMeetingPreference = label),
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? defoultColor : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: isSelected ? defoultColor : greyColor.withOpacity(0.5)),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : greyColor,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
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
          _showConfirmationDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: defoultColor,
          minimumSize: Size(double.infinity, 50.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          elevation: 0,
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: blackColor, size: 24.sp),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'You Sure You will give money?\nYou chose to give Organic apples (2kg) First ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D2D2D),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        side: BorderSide(color: greyColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoutes.tradeCompletion);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF215BA3), // Specific blue from SS
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        elevation: 0,
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
