import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BouncingArrows extends StatefulWidget {
  final VoidCallback? onTap;
  const BouncingArrows({super.key, required this.onTap});

  @override
  State<BouncingArrows> createState() => _BouncingArrowsState();
}

class _BouncingArrowsState extends State<BouncingArrows>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _arrow1Offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Loop animation

    _arrow1Offset = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.2),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _arrow1Offset,
      child: IconButton(
          onPressed: widget.onTap,
          icon: Icon(Icons.keyboard_arrow_down,
              size: 40.sp, color: Colors.black54)),
    );
  }
}
