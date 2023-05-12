import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/home/views/widgets/social_icons.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  txt.rightsReserved,
                  style: TextStyles.body1.copyWith(
                    fontSize: 10.0,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: SocialIconButtons(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
