import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key, required this.isSmall});
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    return Padding(
      padding: isSmall
          ? const EdgeInsets.all(5)
          : const EdgeInsets.only(right: 80.0),
      child: Text(
        txt.summary,
        textAlign: isSmall ? TextAlign.center : null,
        style: TextStyles.body,
      ),
    );
  }
}
