import 'dart:math';

import 'package:bill_splitter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';

class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key});

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _arrowAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor,
        borderRadius: BorderRadius.circular(40.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// Arrows animation on the right
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 120.w,
              child: AnimatedBuilder(
                animation: _arrowAnimation,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment(_arrowAnimation.value, 0),
                        end: Alignment(1.0, 0),
                        colors: [
                          Colors.white.withValues(alpha: 0.2),
                          Colors.white.withValues(alpha: 0.8),
                          Colors.white.withValues(alpha: 0.4),
                        ],
                      ).createShader(bounds);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(7, (_) {
                        return Transform.rotate(
                          angle: -pi / 2,
                          child: Image.asset(Assets.icons.arrow.path,
                              height: 16.sp,
                              color: AppColors.kWhite.withValues(alpha: 0.4)),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 50.h,
            width: 170,
            decoration: BoxDecoration(
              color: AppColors.kScaffoldColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(
              child: Text(
                "Confirm Split",
                style: AppTypography.kSemiBold14.copyWith(
                  color: AppColors.kWhite,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
