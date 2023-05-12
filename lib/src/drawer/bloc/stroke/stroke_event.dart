part of 'stroke_bloc.dart';

abstract class StrokeEvent extends Equatable {
  const StrokeEvent();

  @override
  List<Object> get props => [];
}

class StrokeChanged extends StrokeEvent {
  const StrokeChanged(this.paint);
  final Paint paint;
}

class SettingStrokeWidth extends StrokeEvent {
  const SettingStrokeWidth(this.strokeWidth);
  final double strokeWidth;
}
