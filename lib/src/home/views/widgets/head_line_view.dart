import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';

class HeadLineView extends StatelessWidget {
  const HeadLineView({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    return Text(
      txt.presentation,
      style: TextStyles.subHeading,
    );
  }
}
