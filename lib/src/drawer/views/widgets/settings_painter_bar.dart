import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/drawing/drawing_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/stroke/stroke_bloc.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';

class SettingPainterBar extends StatelessWidget {
  const SettingPainterBar({
    super.key,
    required this.txt,
  });

  final AppLocalizations txt;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 50,
      ),
      child: Container(
        color: Colors.grey,
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.read<StrokeBloc>().add(StrokeChanged(
                        Paint()
                          ..blendMode = BlendMode.srcOver
                          ..color = Colors.black,
                      ));
                },
                child: Text(
                  txt.black,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: (() {
                  context.read<StrokeBloc>().add(StrokeChanged(
                        Paint()
                          ..blendMode = BlendMode.srcOver
                          ..color = Colors.blue,
                      ));
                }),
                child: Text(
                  txt.blue,
                  style: TextStyle(
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: (() {
                  context.read<StrokeBloc>().add(StrokeChanged(
                        Paint()
                          ..blendMode = BlendMode.srcOver
                          ..color = Colors.red,
                      ));
                }),
                child: Text(
                  txt.red,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.read<StrokeBloc>().add(StrokeChanged(
                        Paint()..blendMode = BlendMode.clear,
                      ));
                },
                child: Text(
                  txt.erase,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: (() {
                  context
                      .read<StrokeBloc>()
                      .add(const SettingStrokeWidth(-0.5));
                }),
                child: Text(
                  '${txt.stroke} -0.5',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.read<StrokeBloc>().add(const SettingStrokeWidth(0.5));
                },
                child: Text(
                  '${txt.stroke}  +0.5',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.read<DrawingBloc>().add(Undo());
                },
                child: Text(
                  txt.undo,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.read<DrawingBloc>().add(Clear());
                },
                child: Text(
                  txt.clear,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
