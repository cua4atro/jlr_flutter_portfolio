import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/drawing/drawing_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/bloc/stroke/stroke_bloc.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/drawer_view.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  static const routeName = '/drawer_page';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DrawingBloc(),
        ),
        BlocProvider(
          create: (context) => StrokeBloc(),
        )
      ],
      child: const DrawerView(),
    );
  }
}
