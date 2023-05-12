part of 'stroke_bloc.dart';

enum StrokeStatus { initial, current }

class StrokeState extends Equatable {
  const StrokeState({
    this.status = StrokeStatus.initial,
    required this.strokeSettings,
  });
  final Paint strokeSettings;
  final StrokeStatus status;

  StrokeState.initial()
      : this(
          strokeSettings: defaultPaint,
        );

  StrokeState copyWith({
    Paint? strokeSettings,
  }) {
    return StrokeState(strokeSettings: strokeSettings ?? this.strokeSettings);
  }

  @override
  List<Object> get props => [strokeSettings];
}
