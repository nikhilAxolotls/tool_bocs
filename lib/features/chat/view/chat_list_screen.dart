import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/core/controller/shimmer_controller.dart';
import 'package:tool_bocs/core/widgets/shimmer_box.dart';
import 'package:tool_bocs/features/chat/view/dummy_chat_screen.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shimmer = context.watch<ShimmerController>();

    return Scaffold(
      backgroundColor: context.scaffoldBg,
      body: shimmer.isLoading
          ? _buildShimmer(context)
          : Column(
              children: [
                Container(
                  height: 75.h,
                  color: defoultColor,
                ),
                // Container(
                //   width: double.infinity,
                //   alignment: Alignment.centerLeft,
                //   padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 10.h),
                //   color: defoultColor,
                //   child: IconButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     icon: const Icon(
                //       Icons.arrow_back_ios,
                //       color: Colors.white,
                //       size: 25,
                //     ),
                //   ),
                // ),
                _buildSearchBox(context),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildChatItem(
                          context,
                          'David Wayne',
                          'Thanks a bunch! Have a great day! 😊',
                          '10:25',
                          '5',
                          true,
                          'assets/profile1.png'),
                      _buildChatItem(
                          context,
                          'Edward Davidson',
                          'Great, thanks so much! 💫',
                          '22:20',
                          '12',
                          false,
                          'assets/profile1.png',
                          date: '09/05'),
                      _buildChatItem(
                          context,
                          'Angela Kelly',
                          'Appreciate it! See you soon! 🚀',
                          '10:45',
                          '1',
                          false,
                          'assets/profile1.png',
                          date: '08/05'),
                      _buildChatItem(context, 'Jean Dare', 'Hooray! 🎉',
                          '20:10', '', false, 'assets/profile1.png',
                          date: '05/05'),
                      _buildChatItem(
                          context,
                          'Dennis Borer',
                          'Your order has been successfully delivered',
                          '17:02',
                          '',
                          false,
                          'assets/profile1.png',
                          date: '05/05'),
                      _buildChatItem(context, 'Cayla Rath', 'See you soon!',
                          '11:20', '', false, 'assets/profile1.png',
                          date: '05/05'),
                      _buildChatItem(
                          context,
                          'Erin Turcotte',
                          'I’m ready to drop off your delivery. 👍',
                          '19:35',
                          '',
                          false,
                          'assets/profile1.png',
                          date: '02/05'),
                      _buildChatItem(
                          context,
                          'Rodolfo Walter',
                          'Appreciate it! Hope you enjoy it!',
                          '07:55',
                          '',
                          false,
                          'assets/profile1.png',
                          date: '01/05'),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75.h,
          color: defoultColor,
        ),
        Container(
          color: defoultColor,
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
          child: ShimmerBox(height: 50.h, width: double.infinity, radius: 10.r),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 8,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: context.dividerColor)),
              ),
              child: Row(
                children: [
                  ShimmerBox(height: 60.r, width: 60.r, radius: 30.r),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerBox(height: 20.h, width: 120.w),
                            ShimmerBox(height: 14.h, width: 40.w),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                                child: ShimmerBox(
                                    height: 16.h, width: double.infinity)),
                            SizedBox(width: 8.w),
                            ShimmerBox(height: 18.h, width: 18.w, radius: 6.r),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    return Container(
      color: defoultColor,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: context.subTextColor),
            SizedBox(width: 10.w),
            Text(
              'Search ...',
              style: TextStyle(color: context.subTextColor, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context,
    String name,
    String message,
    String time,
    String unreadCount,
    bool isOnline,
    String imagePath, {
    String? date,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DummyChatScreen(), //ChatScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.dividerColor)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: context.textColor,
                          fontFamily: FontFamily.openSans,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                time,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: greenColor,
                                  fontFamily: FontFamily.openSans,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              if (date != null)
                                Text(
                                  date,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: greyColor,
                                    fontFamily: FontFamily.openSans,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: context.subTextColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.openSans,
                          ),
                        ),
                      ),
                      if (unreadCount.isNotEmpty)
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: defoultColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            unreadCount,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.openSans,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
