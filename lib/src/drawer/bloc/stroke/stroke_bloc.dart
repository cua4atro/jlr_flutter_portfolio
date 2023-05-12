import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'stroke_event.dart';
part 'stroke_state.dart';

final Paint defaultPaint = Paint()
  ..color = Colors.black
  ..strokeWidth = 2;

class StrokeBloc extends Bloc<StrokeEvent, StrokeState> {
  StrokeBloc() : super(StrokeState.initial()) {
    on<StrokeChanged>(_onStrokeChanged);
    on<SettingStrokeWidth>(_onSettingStrokeWidth);
  }

  FutureOr<void> _onStrokeChanged(
      StrokeChanged event, Emitter<StrokeState> emit) {
    emit(state.copyWith(
      strokeSettings: event.paint,
    ));
  }

  FutureOr<void> _onSettingStrokeWidth(
      SettingStrokeWidth event, Emitter<StrokeState> emit) {
    if (state.strokeSettings.strokeWidth + event.strokeWidth != 0) {
      state.strokeSettings.strokeWidth =
          state.strokeSettings.strokeWidth + event.strokeWidth;
      emit(state.copyWith(
        strokeSettings: state.strokeSettings,
      ));
    }
  }
}
