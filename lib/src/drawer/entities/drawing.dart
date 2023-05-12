import 'package:equatable/equatable.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/canvas_path.dart';

class Drawing extends Equatable {
  final List<CanvasPath> canvasPaths;

  const Drawing({
    required this.canvasPaths,
  });

  @override
  List<Object?> get props => [canvasPaths];
}
