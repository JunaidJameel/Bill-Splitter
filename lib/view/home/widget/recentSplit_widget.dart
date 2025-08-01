import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';
import 'package:bill_splitter/const/app_utils.dart';
import 'package:bill_splitter/const/extensions/extension_sizebox.dart';
import 'package:bill_splitter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSplitWidget extends StatelessWidget {
  const RecentSplitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.kSecondaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _buildNearByFriends(),
          _buildRecentlySplit(),
        ],
      ),
    );
  }

  Widget _buildNearByFriends() {
    List<Map<String, dynamic>> friends = [
      {'name': 'John', 'img': Assets.images.p1},
      {'name': 'Lion', 'img': Assets.images.p4},
      {'name': 'Bashir', 'img': Assets.images.p3},
    ];
    return Column(
      children: [
        20.vSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Friends',
              style: AppTypography.kRegular14,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: AppTypography.kSemiBold14
                      .copyWith(color: AppColors.kPrimary),
                ))
          ],
        ),
        Wrap(
            spacing: 15,
            runSpacing: 12,
            children:
                friends.map((friend) => _buildFriendsTile(friend)).toList())
      ],
    );
  }

  Widget _buildFriendsTile(friend) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.kScaffoldColor,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 20.sp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(friend['img'].path),
                  ),
                ),
              ),
              8.vSpace,
              Text(
                friend['name'],
                style: AppTypography.kRegular10,
              ),
              12.vSpace,
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.kPrimary,
          radius: 12.sp,
          child: Icon(
            Icons.add,
            size: 16.sp,
          ),
        )
      ],
    );
  }

  // recently split

  Widget _buildRecentlySplit() {
    List<Map<String, dynamic>> recentlySplit = [
      {
        'name': 'Alex',
        'img': Assets.images.p5.path,
        'color': Colors.amber[100],
      },
      {
        'name': 'Brain',
        'img': Assets.images.p6.path,
        'color': Colors.blueGrey[100],
      },
      {
        'name': 'Mike',
        'img': Assets.images.p7.path,
        'color': Colors.lightBlue[100],
      },
      {
        'name': 'Slang',
        'img': Assets.images.p1.path,
        'color': Colors.red[100],
      }
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.vSpace,
        Text(
          'Recently Split',
          style: AppTypography.kRegular14,
        ),
        Row(),
        20.vSpace,
        Wrap(
            spacing: 25,
            runSpacing: 12,
            children:
                recentlySplit.map((person) => _buildSplitTile(person)).toList())
      ],
    );
  }

  Widget _buildSplitTile(person) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: person['color'],
          radius: 20.sp,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(person['img']),
            ),
          ),
        ),
        8.vSpace,
        Text(
          person['name'],
          style: AppTypography.kRegular10,
        ),
        30.vSpace,
      ],
    );
  }
}
