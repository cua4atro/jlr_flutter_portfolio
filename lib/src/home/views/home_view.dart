import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/home/views/home_large_view.dart';
import 'package:jlr_flutter_portfolio/src/home/views/home_small_view.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';
import 'package:jlr_flutter_portfolio/src/theme/theme_config.dart';
import 'package:jlr_flutter_portfolio/src/widgets/responsive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkPrimaryColor,
      appBar: AppBar(
        titleSpacing: 20,
        title: Text(
          'JLR Flutter Portfolio',
          style: TextStyles.logo,
        ),
        backgroundColor: darkAppBarColor,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/drawer_page');
            },
            child: Text(
              txt.leaveYourSign,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
        ],
      ),
      body: ResponsiveLayoutBuilder(
        small: (context, constraints) =>
            HomeBodySmallView(size: size, txt: txt),
        large: (context, constraints) =>
            HomeBodyLargeView(size: size, txt: txt),
      ),
    );
  }
}
