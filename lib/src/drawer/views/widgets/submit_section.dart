import 'dart:ui' as ui;
import 'dart:developer' as develop;

import 'package:file_saver/file_saver.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jlr_flutter_portfolio/src/drawer/views/widgets/user_name_field.dart';
import 'package:jlr_flutter_portfolio/src/localization/l10n.dart';

import 'package:universal_html/html.dart' as html;

class SubmitSection extends StatelessWidget {
  const SubmitSection({super.key, required this.canvasGlobalKey});

  final GlobalKey canvasGlobalKey;
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final txt = AppLocalizations.of(context);
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade900,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserNameField(
          controller: textController,
        ),
        Container(
          height: 80,
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: style,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(AppLocalizations.of(context).thanks),
                  content: Text(txt.leaveAutograph),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        Uint8List? pngBytes = await getBytes();
                        if (pngBytes != null) {
                          saveFile(
                            bytes: pngBytes,
                            extension: 'png',
                            userName: textController.text,
                          );
                        }
                      },
                      child: Text(txt.download),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(txt.seeYou),
                    )
                  ],
                ),
              );
              Uint8List? pngBytes = await getBytes();

              const extension = 'png';
              final storageRef = FirebaseStorage.instance.ref();
              UploadTask? uploadTask;
              final userName = textController.text;
              final nameF = (userName.isNotEmpty)
                  ? '$userName-${DateTime.now().toIso8601String()}.$extension'
                  : 'AnonimusRockStar-${DateTime.now().toIso8601String()}.$extension';

              uploadTask = storageRef.child(nameF).putData(pngBytes!);
              final snapshot = await uploadTask.whenComplete(() {
                develop.log("uploapded");
              });
            },
            child: Text(txt.submitButton),
          ),
        ),
      ],
    );
  }

  void saveFile(
      {required Uint8List bytes,
      required String extension,
      String? userName}) async {
    if (kIsWeb) {
      html.AnchorElement()
        ..href = '${Uri.dataFromBytes(bytes, mimeType: 'image/$extension')}'
        ..download = (userName != null)
            ? '$userName-${DateTime.now().toIso8601String()}.$extension'
            : 'AnonimusRockStar-${DateTime.now().toIso8601String()}.$extension'
        ..style.display = 'none'
        ..click();
    } else {
      await FileSaver.instance.saveFile(
        name: (userName != null)
            ? '$userName-${DateTime.now().toIso8601String()}.$extension'
            : 'AnonimusRockStar-${DateTime.now().toIso8601String()}.$extension',
        bytes: bytes,
        ext: extension,
        mimeType: extension == 'png' ? MimeType.png : MimeType.jpeg,
      );
    }
  }

  Future<Uint8List?> getBytes() async {
    RenderRepaintBoundary boundary = canvasGlobalKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    return pngBytes;
  }
}
