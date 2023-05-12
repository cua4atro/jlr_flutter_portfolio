import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/canvas_path.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/drawing.dart';

class Painter extends CustomPainter {
  final Drawing drawing;

  Painter({
    required this.drawing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final List<CanvasPath> canvasPaths = drawing.canvasPaths;

    var paint = Paint();

    if (canvasPaths.isNotEmpty) {
      canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

      //!draw all the paths
      for (var canvasPath in canvasPaths) {
        if (canvasPath.drawPoints.isNotEmpty) {
          final Paint currentPathSettings = canvasPath.paint;

          paint = canvasPath.paint..style = PaintingStyle.stroke;

          //some value for radius based on experimenting lol
          final raidus = math.sqrt(currentPathSettings.strokeWidth) / 20;

          canvas.drawPath(canvasPath.path, paint);

          if (currentPathSettings.strokeWidth > 1) {
            for (int i = 0; i < canvasPath.drawPoints.length - 1; i++) {
              // canvas.drawLine(canvasPath.drawPoints[i],
              //     canvasPath.drawPoints[i + 1], _paint);
              canvas.drawCircle(
                  canvasPath.drawPoints[i],
                  currentPathSettings.strokeWidth < 1
                      ? currentPathSettings.strokeWidth
                      : raidus,
                  paint);
            }
          }
        }
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) => true;
}
