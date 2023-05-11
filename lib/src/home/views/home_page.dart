import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/home/views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
