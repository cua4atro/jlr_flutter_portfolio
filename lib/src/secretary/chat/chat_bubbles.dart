import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class SecretaryChatBubbles extends StatefulWidget {
  const SecretaryChatBubbles({super.key});

  @override
  State<SecretaryChatBubbles> createState() => _SecretaryChatBubblesState();
}

class _SecretaryChatBubblesState extends State<SecretaryChatBubbles> {
  ValueNotifier<int> index = ValueNotifier(0);

  Future<void> starTalking() async {
    const duration = Duration(seconds: 5);
    Timer.periodic(duration, (Timer t) {
      if (index.value < 24) {
        _incrementIndex();
      } else {
        setState(() {
          index.value = 0;
        });
      }
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
  Widget build(BuildContext context) {
    final List<String> phrases = [
      'hola',
      'como estas',
      'no esta funcionando esto',
      'a veces tengo mucho trabajo que resolver pero las documentacione no son muy claras',
      'pero es algo que difruto mucho',
      'aunque todo cansa,',
      'hola',
      'como estas',
      'no esta funcionando esto',
      'a veces tengo mucho trabajo que resolver',
      'pero es algo que difruto mucho',
      'aunque todo cansa,',
      'hola',
      'como estas',
      'no esta funcionando esto',
      'a veces tengo mucho trabajo que resolver',
      'pero es algo que difruto mucho',
      'aunque todo cansa,',
      'hola',
      'como estas',
      'no esta funcionando esto',
      'a veces tengo mucho trabajo que resolver pero las documentacione no son muy claras',
      'pero es algo que difruto mucho',
      'aunque todo cansa,',
      'perro'
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        developer.log(constraints.toString());
        return SizedBox(
          width: constraints.maxWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ChatBubble(
                    alignment: Alignment.center,
                    clipper: ChatBubbleClipper3(
                      type: BubbleType.sendBubble,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: index,
                      builder: (context, value, child) => ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth / 3,
                        ),
                        child: Text(
                          phrases[index.value],
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
                width: constraints.maxWidth / 1.65,
              ),
            ],
          ),
        );
      },
    );
  }
}
