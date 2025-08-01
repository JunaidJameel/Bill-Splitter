import 'package:bill_splitter/app_widgets/buttons/primary_button.dart';
import 'package:bill_splitter/app_widgets/buttons/rich_text_widget.dart';
import 'package:bill_splitter/app_widgets/painter/billCustom_painter.dart';
import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';
import 'package:bill_splitter/const/app_utils.dart';
import 'package:bill_splitter/const/extensions/extension_sizebox.dart';
import 'package:bill_splitter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptWidget extends StatelessWidget {
  final List<Map<String, dynamic>> splitWith = [
    {
      'img': Assets.images.p1.path,
      'color': Colors.purple[100],
    },
    {
      'img': Assets.images.p6.path,
      'color': Colors.teal[100],
    },
    {
      'img': Assets.images.p2.path,
      'color': Colors.orange[100],
    },
  ];

  ReceiptWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                30.vSpace,
                Padding(
                  padding: kPagePadding,
                  child: CustomPaint(
                    size: Size(
                      MediaQuery.of(context).size.width,
                      250.h,
                    ),
                    painter: BillPainter(
                      bgColor: AppColors.kPrimary,
                      borderColor: AppColors.kPrimary,
                      dottedLineColor: AppColors.kSecondaryColor,
                      contentHeight: 120,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                40.vSpace,
                Center(
                  child: PrimaryButton(
                    radius: 8,
                    height: 35.h,
                    btnColor: AppColors.kScaffoldColor,
                    text: 'Receipt',
                    onTap: () {},
                    width: MediaQuery.sizeOf(context).width * .24,
                    style: AppTypography.kSemiBold14
                        .copyWith(color: AppColors.kPrimary, fontSize: 12.sp),
                  ),
                ),
                30.vSpace,
                Padding(
                  padding: kPagePadding * 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRichText(
                        info: 'Title',
                        title: '\nTeam Dinner',
                      ),
                      CustomRichText(
                        info: 'Total Bill',
                        title: '\n\$750.86',
                      ),
                    ],
                  ),
                ),
                16.vSpace,
                Container(
                  margin: kPagePadding * 2,
                  height: 80.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.kScaffoldColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                          spacing: 0,
                          runSpacing: 12,
                          children: splitWith
                              .map((friend) => _buidSplitWith(friend))
                              .toList()),
                      5.vSpace,
                      Text(
                        'Splitting With',
                        style:
                            AppTypography.kSemiBold14.copyWith(fontSize: 13.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buidSplitWith(friend) {
    return Align(
      widthFactor: .7,
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
            color: friend['color'],
            border: Border.all(color: AppColors.kBlack),
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(friend['img']),
        ),
      ),
    );
  }
}
