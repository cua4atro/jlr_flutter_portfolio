import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';
import 'package:jlr_flutter_portfolio/src/theme/text_styles.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    required this.txt,
  });

  final AppLocalizations txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt.aboutMe,
      style: TextStyles.logo,
    );
  }
}
