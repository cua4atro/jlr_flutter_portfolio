import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 80.0),
      child: Text(
        txt.summary,
        style: TextStyles.body,
      ),
    );
  }
}
