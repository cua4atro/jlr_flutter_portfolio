import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/secretary/chat/chat_bubbles.dart';

class SecretaryView extends StatelessWidget {
  const SecretaryView({super.key, required this.isSmall});
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: !isSmall
          ? BoxConstraints(
              maxHeight: size.width / 2,
              maxWidth: (size.width - 24) / 2,
            )
          : BoxConstraints(
              maxWidth: size.width * .8, maxHeight: size.width * .6),
      width: !isSmall ? (size.width - 24) / 2 : size.width - 60,
      height: !isSmall
          ? (((size.width - 24) / 2) * (3 / 4))
          : (size.width - 60) * (3 / 4),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          image: AssetImage(
            'assets/images/secretary.gif',
          ),
        ),
      ),
      child: Stack(
        children: [
          SecretaryChatBubbles(
            isSmall: isSmall,
          ),
        ],
      ),
    );
  }
}
