import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1Color,
      appBar: _buildAppBar(context),
      body: ListView.builder(
        padding: EdgeInsets.all(20.w),
        itemCount: 10,
        itemBuilder: (context, index) {
          bool isReceived = index == 0;
          return _buildTransactionCard(
            title: isReceived ? 'Received from Rohan' : 'Paid to Poonam',
            dateTime: '12 Jan 2026 • 4:30 PM',
            amount: isReceived ? '50' : '100',
            isReceived: isReceived,
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, color: blackColor),
      ),
      centerTitle: true,
      title: Text(
        'Transaction History',
        style: TextStyle(
          color: blackColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.openSans,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Divider(
          height: 1.h,
          color: greyColor.withOpacity(0.1),
          thickness: 1.h,
        ),
      ),
    );
  }

  Widget _buildTransactionCard({
    required String title,
    required String dateTime,
    required String amount,
    required bool isReceived,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.openSans,
                    color: const Color(0xFF2D2D2D),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  dateTime,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.openSans,
                    color: const Color(0xFF9E9E9E),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isReceived ? '+' : '—'}₹$amount',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.openSans,
              color: isReceived
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFFD32F2F),
            ),
          ),
        ],
      ),
    );
  }
}
