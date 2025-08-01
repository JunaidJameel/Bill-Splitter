import 'dart:math';

import 'package:bill_splitter/app_widgets/buttons/primary_button.dart';
import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';
import 'package:bill_splitter/const/app_utils.dart';
import 'package:bill_splitter/const/extensions/extension_padding.dart';
import 'package:bill_splitter/const/extensions/extension_sizebox.dart';
import 'package:bill_splitter/gen/assets.gen.dart';
import 'package:bill_splitter/view/split/split.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'arrowAnimation_widget.dart';

class BalanceCardWidget extends StatefulWidget {
  const BalanceCardWidget({super.key});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  bool isOpend = false;
  double expandContainer = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            children: [
              20.vSpace,
              Container(
                padding: kPagePadding,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.kPrimary,
                ),
                child: Column(
                  children: [
                    10.vSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.vSpace,
                            Text(
                              'Total Bill',
                              style: AppTypography.kSemiBold16
                                  .copyWith(color: AppColors.kBlack),
                            ),
                            Text(
                              '\$750.86',
                              style: AppTypography.kBold10.copyWith(
                                  color: AppColors.kScaffoldColor,
                                  fontSize: 26.sp),
                            ),
                            20.vSpace,
                            PrimaryButton(
                              height: 45.h,
                              btnColor: AppColors.kScaffoldColor,
                              text: 'Split Now',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SplitView())),
                              width: MediaQuery.sizeOf(context).width * .24,
                              style: AppTypography.kSemiBold14.copyWith(
                                  color: AppColors.kPrimary, fontSize: 12.sp),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            16.vSpace,
                            Text(
                              'Split with',
                              style: AppTypography.kSemiBold14
                                  .copyWith(color: AppColors.kBlack),
                            ),
                            !isOpend
                                ? BouncingArrows(
                                    onTap: () => setState(() {
                                      isOpend = true;
                                      expandContainer = 160.h;
                                    }),
                                  )
                                : SizedBox()
                          ],
                        ),
                      ],
                    ),
                    20.vSpace,
                  ],
                ),
              ),
              30.vSpace,
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(66, 90, 90, 90),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.kSecondaryColor,
                ),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 20.sp,
                        backgroundColor: AppColors.kScaffoldColor,
                        child: Image.asset(Assets.icons.money.path).py(6),
                      ),
                    ),
                    13.hSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your previous split',
                          style: AppTypography.kRegular14
                              .copyWith(color: AppColors.kWhite),
                        ),
                        Text(
                          '\$59.00',
                          style: AppTypography.kRegular14
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          _buildMemberTile(),
        ],
      ),
    );
  }

  Widget _buildMemberTile() {
    List<Map<String, dynamic>> profile = [
      {'color': Colors.blue[200], 'img': Assets.images.p1},
      {'color': Colors.green[200], 'img': Assets.images.p2},
      {'color': Colors.red[200], 'img': Assets.images.p3},
      {'color': Colors.purple[200], 'img': Assets.images.p4},
    ];
    return Positioned(
      right: 35,
      top: 85.h,
      child: ClipRRect(
        child: AnimatedContainer(
            duration: Duration(milliseconds: 320),
            height: isOpend ? 200.h : 0,
            width: 55.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.kWhite,
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: isOpend
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            10.vSpace,
                            for (var person in profile)
                              Align(
                                heightFactor: .8,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 12,
                                            color: Colors.red[200]!)
                                      ],
                                      shape: BoxShape.circle,
                                      color: person['color']),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset(person['img'].path),
                                  ),
                                ),
                              ),
                            Align(
                              heightFactor: .8,
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  // handle your add logic here
                                },
                                child: Container(
                                  height: 30,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[400],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Transform.rotate(
                            angle: pi,
                            child: BouncingArrows(
                                onTap: () => setState(() {
                                      isOpend = false;
                                    }))),
                      ],
                    )
                  : null,
            )),
      ),
    );
  }
}
