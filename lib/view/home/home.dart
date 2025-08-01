import 'package:bill_splitter/const/app_colors.dart';

import 'package:bill_splitter/view/home/widget/balanceCard_Widget.dart';
import 'package:bill_splitter/view/home/widget/header_widget.dart';
import 'package:bill_splitter/view/home/widget/recentSplit_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              BalanceCardWidget(),
              RecentSplitWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
