import 'package:bill_splitter/const/app_colors.dart';
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
      'color': Colors.lightBlueAccent,
      'avatar': 'assets/images/p1.png',
      'amount': 200.86,
      'value': 4.0,
    },
    {
      'name': 'Cody',
      'color': Colors.purpleAccent,
      'avatar': 'assets/images/p2.png',
      'amount': 450.0,
      'value': 6.0,
    },
    {
      'name': 'Khalifa',
      'color': Colors.deepOrangeAccent,
      'avatar': 'assets/images/p3.png',
      'amount': 100.0,
      'value': 2.0,
    },
  ];

  final double _maxValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              CircleAvatar(
                backgroundColor: user['color'],
                backgroundImage: AssetImage(user['avatar']),
              ),
              const SizedBox(width: 10),
              Text(
                user['name'],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              Text(
                '\$${user['amount'].toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
                              width: 6,
                              height: 6,
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
                  trackHeight: 30,
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
