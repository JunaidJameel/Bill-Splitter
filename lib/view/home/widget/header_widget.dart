import 'package:bill_splitter/app_widgets/buttons/rich_text_widget.dart';
import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';
import 'package:bill_splitter/const/app_utils.dart';

import 'package:bill_splitter/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRichText(
                info: 'Raheel',
                title: '\nSplit your Bills',
                firstTextStyle: AppTypography.kSemiBold14
                    .copyWith(color: AppColors.kWhite, fontSize: 16.sp),
                secondTextStyle: AppTypography.kSemiBold14
                    .copyWith(color: AppColors.kPrimary, fontSize: 16.sp),
              )
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.kSecondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text('User',
                          style: AppTypography.kRegular10
                              .copyWith(color: AppColors.kWhite)),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: -05,
                  left: 0,
                  right: 0,
                  child: Lottie.asset(Assets.lottie.humans)),
            ],
          ),
        ],
      ),
    );
  }
}
