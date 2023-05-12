import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';

class SecretaryChatBubbles extends StatefulWidget {
  const SecretaryChatBubbles({super.key, required this.isSmall});

  final bool isSmall;

  @override
  State<SecretaryChatBubbles> createState() => _SecretaryChatBubblesState();
}

class _SecretaryChatBubblesState extends State<SecretaryChatBubbles> {
  bool isFinished = false;
  ValueNotifier<int> index = ValueNotifier(0);

  Future<void> starTalking() async {
    const duration = Duration(seconds: 5);
    Timer.periodic(duration, (Timer t) {
      if (index.value < 13 && !isFinished && context.mounted) {
        _incrementIndex();
      } else if (context.mounted) {
        setState(() {
          isFinished = true;
        });
      }
    });
  }

  void finishScretary() {
    setState(() {
      isFinished = true;
    });
  }

  void _incrementIndex() {
    developer.log(index.value.toString());
    setState(() {
      index.value += 1;
    });
  }

  @override
  void initState() {
    starTalking();
    super.initState();
  }

  @override
  void dispose() {
    finishScretary();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = AppLocalizations.of(context);
    final List<String> phrases = [
      txt.hello,
      txt.secretary1,
      txt.secretary2,
      txt.secretary3,
      txt.secretary4,
      txt.secretary5,
      txt.secretary6,
      txt.secretary7,
      txt.secretary8,
      txt.secretary9,
      txt.secretary10,
      txt.secretary11,
      txt.secretary12,
      txt.secretary13,
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        developer.log(constraints.toString());
        return SizedBox(
          width: constraints.maxWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ChatBubble(
                    backGroundColor: Colors.grey,
                    alignment: Alignment.center,
                    clipper: ChatBubbleClipper3(
                      type: BubbleType.sendBubble,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: index,
                      builder: (context, value, child) => ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * .32,
                        ),
                        child: Text(
                          phrases[index.value],
                          style: TextStyle(
                            fontSize: constraints.maxWidth < 500 ? 10 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight / 2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
                width: constraints.maxWidth * .62,
              ),
            ],
          ),
        );
      },
    );
  }
}
