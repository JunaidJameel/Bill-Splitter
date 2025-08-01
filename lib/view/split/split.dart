import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';
import 'package:bill_splitter/const/app_utils.dart';
import 'package:bill_splitter/const/extensions/extension_sizebox.dart';
import 'package:bill_splitter/view/split/widget/confirm_button.dart';
import 'package:bill_splitter/view/split/widget/receipt_widget.dart';
import 'package:bill_splitter/view/split/widget/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplitView extends StatelessWidget {
  const SplitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          ReceiptWidget(),
          SliderWidget(),
          ConfirmButton(),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      toolbarHeight: 60.h,
      backgroundColor: AppColors.kScaffoldColor,
      title: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
            margin: kLeftPadding,
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.kSecondaryColor),
            child: BackButton(color: AppColors.kWhite)),
      ),
      actions: [
        Row(
          children: [
            Text(
              'Split Now',
              style: AppTypography.kSemiBold14
                  .copyWith(color: AppColors.kPrimary, fontSize: 20.sp),
            ),
            20.hSpace,
            Icon(
              Icons.more_vert,
              color: AppColors.kPrimary,
            ),
            20.hSpace,
          ],
        ),
      ],
    );
  }
}
