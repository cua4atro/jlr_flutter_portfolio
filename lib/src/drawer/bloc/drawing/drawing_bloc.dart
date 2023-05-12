import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/canvas_path.dart';
import 'package:jlr_flutter_portfolio/src/drawer/entities/drawing.dart';

part 'drawing_event.dart';
part 'drawing_state.dart';

class DrawingBloc extends Bloc<DrawingEvent, DrawingState> {
  DrawingBloc() : super(const DrawingInitial(currentDrawing: [])) {
    on<UpdateDrawing>(_upDateDrawing);
    on<StartDrawing>(_startDrawing);
    on<SaveDrawing>(_onSaveDrawing);
    on<PreviousDrawing>(_onPreviousDrawing);
    on<NextDrawing>(_onNextDrawing);
    on<Undo>(_onUndo);
    on<Clear>(_onClearDrawing);
  }

  // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
  final Drawing drawingC = Drawing(canvasPaths: []);
  FutureOr<void> _upDateDrawing(
      UpdateDrawing event, Emitter<DrawingState> emit) {
    emit(DrawingLoading(currentDrawing: drawingC.canvasPaths));
    drawingC.canvasPaths.last = event.canvasPath;
    emit(DrawingLoaded(currentDrawing: drawingC.canvasPaths));
  }

  void _startDrawing(StartDrawing event, Emitter<DrawingState> emit) {
    emit(DrawingLoading(currentDrawing: drawingC.canvasPaths));
    drawingC.canvasPaths.add(event.canvasPath);
    emit(DrawingLoaded(currentDrawing: drawingC.canvasPaths));
  }

  void _onSaveDrawing(SaveDrawing event, Emitter<DrawingState> emit) {}

  void _onPreviousDrawing(PreviousDrawing event, Emitter<DrawingState> emit) {}

  void _onUndo(Undo event, Emitter<DrawingState> emit) {
    if (drawingC.canvasPaths.isNotEmpty) {
      emit(DrawingLoading(currentDrawing: drawingC.canvasPaths));
      drawingC.canvasPaths.removeLast();
      emit(DrawingLoaded(currentDrawing: drawingC.canvasPaths));
    }
  }

  FutureOr<void> _onNextDrawing(
      NextDrawing event, Emitter<DrawingState> emit) {}

  FutureOr<void> _onClearDrawing(Clear event, Emitter<DrawingState> emit) {
    emit(DrawingLoading(currentDrawing: drawingC.canvasPaths));
    drawingC.canvasPaths.clear();
    emit(DrawingInitial(currentDrawing: drawingC.canvasPaths));
  }
}
