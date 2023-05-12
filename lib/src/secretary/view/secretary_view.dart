import 'package:flutter/material.dart';
import 'package:jlr_flutter_portfolio/src/secretary/chat/chat_bubbles.dart';

class SecretaryView extends StatelessWidget {
  const SecretaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.width / 2,
        maxWidth: (size.width - 24) / 2,
      ),
      width: (size.width - 24) / 2,
      height: (((size.width - 24) / 2) * (3 / 4)),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          image: AssetImage(
            'assets/images/secretary.gif',
          ),
        ),
      ),
      child: const Stack(
        children: [
          SecretaryChatBubbles(),
        ],
      ),
    );
  }
}
