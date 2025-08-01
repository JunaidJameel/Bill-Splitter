import 'dart:math';

import 'package:flutter/material.dart';

class BillPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;
  final Color dottedLineColor;
  final double contentHeight;

  /// Constants for ticket shape cutout sizing.
  ///
  /// `_cornerGap`: The gap in pixels between the ticket corners and the start of the cutout curves.
  /// `_cutoutRadius`: The radius in pixels of the circular cutouts on the sides of the ticket.
  /// `_cutoutDiameter`: The diameter in pixels of the circular cutouts, calculated from the radius.
  static const _cornerGap = 30.0;
  static const _cutoutRadius = 16.0;
  static const _cutoutDiameter = _cutoutRadius * 2.0;

  BillPainter({
    required this.bgColor,
    required this.borderColor,
    required this.dottedLineColor,
    required this.contentHeight,
  });

  /// Overrides [CustomPainter.paint] to draw the ticket shape and visual elements.
  ///
  /// Calculates sizing and positions for the ticket shape, cutouts, and dotted line.
  /// Creates [Paint] objects with styles and colors. Draws the path representing
  /// the ticket shape, cutouts, and dotted line divider onto the [Canvas].
  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = contentHeight + _cutoutRadius + -50.0;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius;
    double dottedLineStartX = _cutoutRadius;

    // Adjust the calculation of dottedLineEndX
    final double dottedLineEndX = maxWidth - _cutoutRadius;

    // Calculate the maximum dash width that fits within the curve
    final double maxDashWidth = (dottedLineEndX - dottedLineStartX) / 2;

    // Set a maximum dash width (you can adjust this as needed)
    double maxAllowedDashWidth = 8.0;

    // Calculate the actual dash width (minimum of maxAllowedDashWidth and maxDashWidth)
    final double dashWidth = min(maxDashWidth, maxAllowedDashWidth);
    double dashSpace = 8.0;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = dottedLineColor
      ..strokeWidth = 1.0;

    var path = Path();

    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  /// Draws a semicircular cutout in the path.
  ///
  /// Parameters:
  /// - path: The [Path] to draw the cutout in.
  /// - startX: The x-coordinate of the start point of the cutout arc.
  /// - endY: The y-coordinate of the end point of the cutout arc.
  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  /// Draws a semicircular arc in the path from the current point to the given end point.
  ///
  /// Parameters:
  /// - path: The [Path] to draw the arc in.
  /// - endPointX: The x-coordinate of the end point of the arc.
  /// - endPointY: The y-coordinate of the end point of the arc.
  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  /// Indicates if this [BillPainter] should repaint when the specified
  /// [oldDelegate] changes. Returns false to avoid unnecessary repainting.
  @override
  bool shouldRepaint(BillPainter oldDelegate) => false;

  /// Indicates if this [BillPainter] should repaint when the specified
  /// [oldDelegate] changes. Returns false to avoid unnecessary repainting.
  @override
  bool shouldRebuildSemantics(BillPainter oldDelegate) => false;
}
