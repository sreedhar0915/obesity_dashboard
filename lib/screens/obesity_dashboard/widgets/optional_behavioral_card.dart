import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obesity_dashboard/helpers/app_colors.dart';
import 'package:obesity_dashboard/helpers/size_extension.dart';
import 'package:obesity_dashboard/helpers/sizedbox.dart';

class OptionalBehavioralCard extends StatefulWidget {
  final String title;
  final String rating;
  final String status;
  final Color statusColor;
  final String statusimage;
  const OptionalBehavioralCard({
    super.key,
    required this.title,
    required this.rating,
    required this.status,
    required this.statusColor,
    required this.statusimage,
  });

  @override
  State<OptionalBehavioralCard> createState() => _OptionalBehavioralCardState();
}

class _OptionalBehavioralCardState extends State<OptionalBehavioralCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 89.h,
      // width: 343.w,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          sizedBoxWithHeight(10),
          Row(
            children: [
              Text(widget.rating,
                  style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
              const Spacer(),
              Image.asset(widget.statusimage, height: 16.h, width: 16.w),
              sizedBoxWithWidth(4),
              Text(
                widget.status,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: widget.statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
