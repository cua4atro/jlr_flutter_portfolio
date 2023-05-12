import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/drawing/drawing_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/widgets/canvas_clipper.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/widgets/paint_canvas.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/widgets/settings_painter_bar.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/widgets/submit_section.dart';
import 'package:jlr_flutter_portfolio/src/home/views/widgets/widgets.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/theme_config.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final canvasGlobalKey = GlobalKey();
    final txt = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkAppBarColor,
        title: Text(txt.leaveAutograph),
      ),
      backgroundColor: darkPrimaryColor,
      body: Column(
        children: [
          SettingPainterBar(txt: txt),
          const Spacer(),
          ClipPath(
            clipper: CanvasClipper(),
            child:
                BlocBuilder<DrawingBloc, DrawingState>(builder: (ctx, state) {
              //log("Drawing bloc state:" + state.toString());
              return RepaintBoundary(
                key: canvasGlobalKey,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green.shade900,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height: size.height * .6,
                  width: size.width * .9,
                  child: PaintCanvas(
                    initialdrawPoints: state.currentDrawing,
                  ),
                ),
              );
            }),
          ),
          const Spacer(),
          SubmitSection(
            canvasGlobalKey: canvasGlobalKey,
          ),
          const Spacer(),
          ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width,
              ),
              child: const PortfolioFooter()),
        ],
      ),
    );
  }
}
