import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/home/views/widgets/widgets.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';

import '../../secretary/secretary.dart';

class HomeBodyLargeView extends StatelessWidget {
  const HomeBodyLargeView({
    super.key,
    required this.size,
    required this.txt,
  });

  final Size size;
  final AppLocalizations txt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height - 60),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutMe(txt: txt),
                          const SizedBox(
                            height: 18,
                          ),
                          const HeadLineView(),
                          const SizedBox(
                            height: 24,
                          ),
                          const SummaryView(
                            isSmall: false,
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          const SkillsAndEduView(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SecretaryView(isSmall: false),
                        //Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              const PortfolioFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
