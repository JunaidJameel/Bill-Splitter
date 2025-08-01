import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/const/app_typography.dart';
import 'package:bill_splitter/const/app_utils.dart';
import 'package:bill_splitter/const/extensions/extension_sizebox.dart';
import 'package:bill_splitter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<Map<String, dynamic>> _users = [
    {
      'name': 'Me',
      'color': Colors.lightBlueAccent[100],
      'avatar': Assets.images.p1.path,
      'amount': 200.86,
      'value': 4.0,
    },
    {
      'name': 'Cody',
      'color': Colors.purple[200],
      'avatar': Assets.images.p2.path,
      'amount': 450.0,
      'value': 6.0,
    },
    {
      'name': 'Khalifa',
      'color': Colors.deepOrangeAccent[100],
      'avatar': Assets.images.p3.path,
      'amount': 100.0,
      'value': 2.0,
    },
  ];

  final double _maxValue = 8.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: kPagePadding,
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return _buildUserSlider(_users[index]);
          },
        ),
      ),
    );
  }

  Widget _buildUserSlider(Map<String, dynamic> user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kWhite),
                  shape: BoxShape.circle,
                  color: user['color'],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(user['avatar']),
                ),
              ),
              const SizedBox(width: 10),
              Text(user['name'], style: AppTypography.kSemiBold16),
              const Spacer(),
              Text('\$${user['amount'].toStringAsFixed(2)}',
                  style: AppTypography.kSemiBold16),
            ],
          ),
          15.vSpace,
          Stack(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.kSecondaryColor),
              ),
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: List.generate(_maxValue.toInt() + 1, (index) {
                        return Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 8,
                  inactiveTrackColor: Colors.transparent,
                  activeTrackColor: user['color'],
                  thumbColor: Colors.orangeAccent[100],
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 16),
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
                  min: 0,
                  max: _maxValue,
                  divisions: _maxValue.toInt(),
                  value: user['value'],
                  onChanged: (newValue) {
                    setState(() {
                      user['value'] = newValue;
                      user['amount'] = (newValue * 50).toDouble();
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
