part of 'drawing_bloc.dart';

enum DrawingStatus { loaded, loading, initial }

abstract class DrawingState extends Equatable {
  const DrawingState({
    required this.currentDrawing,
  });

  final List<CanvasPath> currentDrawing;

  @override
  List<Object?> get props => [currentDrawing.length];
}

class DrawingInitial extends DrawingState {
  const DrawingInitial({required super.currentDrawing});
}

class DrawingLoading extends DrawingState {
  const DrawingLoading({required super.currentDrawing});
}

class DrawingLoaded extends DrawingState {
  const DrawingLoaded({required super.currentDrawing});
}
