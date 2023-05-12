import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/drawing/drawing_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/stroke/stroke_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/canvas_path.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/drawing.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/widgets/painter.dart';

class PaintCanvas extends StatefulWidget {
  final List<CanvasPath> initialdrawPoints;

  const PaintCanvas({
    Key? key,
    this.initialdrawPoints = const [],
  }) : super(key: key);

  @override
  State<PaintCanvas> createState() => _PaintCanvasState();
}

class _PaintCanvasState extends State<PaintCanvas> {
  Paint _currentPaintSettings = Paint()
    ..strokeWidth = 2
    ..color = Colors.black;

  CanvasPath _newPath = CanvasPath(
    paint: Paint()
      ..strokeWidth = 2
      ..color = Colors.black,
    drawPoints: const [],
  );

  void addPoint(Offset newPoint) {
    _newPath.quadric(
      newPoint.dx,
      newPoint.dy,
    );
    _newPath.drawPoints.add(newPoint);
    BlocProvider.of<DrawingBloc>(context).add(UpdateDrawing(_newPath));
  }

  void addLastPoint() {
    final Offset lastOffset = _newPath.drawPoints.last;

    final Offset additionalOffset =
        Offset(lastOffset.dx + 10, lastOffset.dy + 10);
    _newPath.drawPoints.add(additionalOffset);
    BlocProvider.of<DrawingBloc>(context).add(UpdateDrawing(_newPath));
  }

  Paint _paintFrom(Paint paint) {
    return Paint()
      ..color = paint.color
      ..strokeWidth = paint.strokeWidth
      ..blendMode = paint.blendMode
      ..strokeCap = paint.strokeCap
      ..shader = paint.shader;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final drawingBloc = BlocProvider.of<DrawingBloc>(context);

    return BlocBuilder<DrawingBloc, DrawingState>(
      builder: (context, state) {
        return CustomPaint(
          isComplex: true,
          willChange: true,
          foregroundPainter: Painter(
            drawing: Drawing(
              canvasPaths: state.currentDrawing,
            ),
          ),
          child: BlocListener<StrokeBloc, StrokeState>(
            listener: (context, state) {
              _currentPaintSettings = state.strokeSettings;
            },
            child: GestureDetector(
              onPanStart: (det) {
                _newPath = CanvasPath(
                    paint: _paintFrom(_currentPaintSettings),
                    drawPoints: [
                      det.localPosition,
                    ]);
                _newPath.movePathTo(det.localPosition.dx, det.localPosition.dy);
                drawingBloc.add(StartDrawing(_newPath));
              },
              onPanUpdate: (det) => addPoint(
                Offset(det.localPosition.dx, det.localPosition.dy),
              ),
              onPanEnd: (det) => addLastPoint(),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: size.height,
                  maxWidth: size.width,
                ),
                color: Colors.black12,
              ),
            ),
          ),
        );
      },
    );
  }
}
