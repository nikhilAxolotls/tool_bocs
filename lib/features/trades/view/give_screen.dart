import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/core/controller/shimmer_controller.dart';
import 'package:tool_bocs/core/widgets/shimmer_box.dart';
import 'package:tool_bocs/routes/app_routes.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class GiveScreen extends StatelessWidget {
  const GiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shimmer = context.watch<ShimmerController>();

    return Scaffold(
      backgroundColor: whiteColor,
      body: shimmer.isLoading
          ? _buildShimmer(context)
          : Column(
              children: [
                _buildHeader(context),
                Divider(
                  color: greyColor.withOpacity(0.5),
                  height: 0.h,
                  thickness: 0.5,
                ),
                _buildFilterButton(context),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    children: [
                      _buildProductCard(
                        context,
                        title: 'IPhone 12 (128GB)',
                        owner: 'RIYA',
                        category: 'Food Giver',
                        distance: '2.5 km away',
                        rating: '4.8',
                        actionLabel: 'Take',
                        description:
                            'Well-maintained phone, smooth performance, no major scratches.',
                      ),
                      SizedBox(height: 16.h),
                      _buildProductCard(
                        context,
                        title: 'IPhone 12 (128GB)',
                        owner: 'RIYA',
                        category: 'Food Giver',
                        distance: '2.5 km away',
                        rating: '4.8',
                        actionLabel: 'Take',
                        description:
                            'Well-maintained phone, smooth performance, no major scratches.',
                      ),
                      SizedBox(height: 16.h),
                      _buildProductCard(
                        context,
                        title: 'IPhone 12 (128GB)',
                        owner: 'RIYA',
                        category: 'Food Giver',
                        distance: '2.5 km away',
                        rating: '4.8',
                        actionLabel: 'Take',
                        description:
                            'Well-maintained phone, smooth performance, no major scratches.',
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 15.h),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2F5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search any Product..',
                      hintStyle: TextStyle(color: greyColor, fontSize: 14.sp),
                      prefixIcon:
                          Icon(Icons.search, color: greyColor, size: 20.sp),
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.createGivePost);
                },
                child: Container(
                  width: 45.h,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: defoultColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 28.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.tune, size: 18.sp),
            SizedBox(width: 8.w),
            Text(
              'Filter',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context, {
    required String title,
    required String owner,
    required String category,
    required String distance,
    required String rating,
    required String actionLabel,
    String? description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetails);
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 136.w,
              height: 154.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),

                // image: const DecorationImage(
                //   image: AssetImage('assets/iphone.png'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Image.asset('assets/iphone.png', fit: BoxFit.cover),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${owner}'s Taking",
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: 12.sp, color: greyColor),
                          SizedBox(width: 2.w),
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: greyColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.openSans,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.openSans,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (description != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: greyColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.openSans,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Icon(Icons.person, color: defoultColor, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "$owner ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.openSans,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(width: 4.w),
                            ),
                            TextSpan(
                              text: "\u2022 $category",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.openSans,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star,
                              color: Colors.amber, size: 16.sp);
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      color: defoultColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      actionLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 20.h),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(child: ShimmerBox(height: 45.h, width: double.infinity)),
              SizedBox(width: 12.w),
              ShimmerBox(height: 45.h, width: 45.h, radius: 22),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: ShimmerBox(height: 140.h, width: double.infinity),
            ),
          ),
        ),
      ],
    );
  }
}
