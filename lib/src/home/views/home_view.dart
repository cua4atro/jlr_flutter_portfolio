import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/home/views/widgets/widgets.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/secretary/view/secretary_view.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';
import 'package:jlr_flutter_portfolio/src/theme/theme_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutMe(txt: txt),
                        const SizedBox(
                          height: 4,
                        ),
                        const HeadLineView(),
                        const SizedBox(
                          height: 24,
                        ),
                        const SummaryView(),
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
                    children: [
                      SecretaryView(),
                      //Spacer(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
