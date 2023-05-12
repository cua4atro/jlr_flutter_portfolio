import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/home/views/widgets/widgets.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';

import '../../secretary/secretary.dart';

class HomeBodySmallView extends StatelessWidget {
  const HomeBodySmallView({
    super.key,
    required this.size,
    required this.txt,
  });

  final Size size;
  final AppLocalizations txt;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: constraints.maxHeight),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SecretaryView(
                isSmall: true,
              ),
              const SizedBox(
                height: 30,
              ),
              AboutMe(txt: txt),
              const SizedBox(
                height: 18,
              ),
              const HeadLineView(),
              const SizedBox(
                height: 24,
              ),
              const SummaryView(
                isSmall: true,
              ),
              const SizedBox(
                height: 48,
              ),
              const SkillsAndEduView(),
              const SizedBox(
                width: 24,
              ),
              const PortfolioFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
