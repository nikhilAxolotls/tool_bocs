import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class ProductDetailsScreen extends StatefulWidget {
  final List<String>? images;
  const ProductDetailsScreen({super.key, this.images});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isPriceSelected = true;
  double _lowerValue = 10;
  double _upperValue = 100;
  bool isNegotiable = false;
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();
  Timer? _autoPlayTimer;

  late final List<String> _imageList;

  @override
  void initState() {
    super.initState();
    _imageList = widget.images ??
        [
          'assets/iphone.png',
          'assets/iphone.png',
          'assets/iphone.png',
          'assets/iphone.png'
        ];
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_imageList.length > 1) {
        int nextIndex = (_currentImageIndex + 1) % _imageList.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutQuart,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(context),
              Divider(
                color: greyColor.withOpacity(0.5),
                height: 0.h,
                thickness: 1,
              ),
              SizedBox(height: 20.h),
              _buildImageCarousel(),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IPhone 12 (128GB)',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.openSans,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildCategoryTag('Electronics'),
                    SizedBox(height: 20.h),
                    _buildOwnerProfile(),
                    SizedBox(height: 20.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.openSans,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'This iPhone 12 is in excellent condition, barely used, with no scratches or dents. It comes with 128GB storage, perfect for all your apps and media. Battery health is at 95%. Includes original box and charging cable. Selling because I upgraded to a newer model. Ready for a new home!',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: greyColor,
                        height: 1.5,
                        fontFamily: FontFamily.openSans,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildReturnSection(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 30.h),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Column(
      children: [
        Container(
          height: 250.h,
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemCount: _imageList.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
                      } else {
                        // Handle initial state before dimensions are available
                        if (index == _currentImageIndex) {
                          value = 1.0;
                        } else {
                          value = 0.9;
                        }
                      }

                      return Transform.scale(
                        scale: value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            image: DecorationImage(
                              image: _imageList[index].startsWith('assets/')
                                  ? AssetImage(_imageList[index])
                                  : NetworkImage(_imageList[index])
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              if (_imageList.length > 1)
                Positioned(
                  bottom: 20.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_imageList.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _currentImageIndex == index ? 20.w : 8.w,
                        height: 8.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: _currentImageIndex == index
                              ? defoultColor
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      );
                    }),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: defoultColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: whiteColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.openSans,
        ),
      ),
    );
  }

  Widget _buildOwnerProfile() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: const AssetImage('assets/profile2.png'),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Riya',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.openSans,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: defoultColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Giving',
                        style: TextStyle(
                          color: defoultColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 2.w),
                    Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.openSans,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      ' (Person rating)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.openSans,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReturnSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What do you want in return ?',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.openSans,
              color: blackColor,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isPriceSelected = true),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            isPriceSelected ? defoultColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isPriceSelected ? Colors.white : blackColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isPriceSelected = false),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: !isPriceSelected
                            ? defoultColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Item',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: !isPriceSelected ? Colors.white : blackColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isPriceSelected) ...[
            SizedBox(height: 24.h),
            _buildPriceRangeSection(),
          ],
        ],
      ),
    );
  }

  Widget _buildPriceRangeSection() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF0F2F5)),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Desired Price Range : \$${_lowerValue.toInt()} - \$${_upperValue.toInt()}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.openSans,
              color: blackColor,
            ),
          ),
          RangeSlider(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            values: RangeValues(_lowerValue, _upperValue),
            min: 0,
            max: 500,
            activeColor: defoultColor,
            inactiveColor: greyColor.withOpacity(0.3),
            onChanged: (RangeValues values) {
              setState(() {
                _lowerValue = values.start;
                _upperValue = values.end;
              });
            },
          ),
          Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isNegotiable,
                  activeColor: defoultColor,
                  onChanged: (value) => setState(() => isNegotiable = value),
                ),
              ),
              Text(
                'Negotiable',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
