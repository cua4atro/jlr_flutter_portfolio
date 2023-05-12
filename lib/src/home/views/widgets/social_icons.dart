import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButtons extends StatelessWidget {
  const SocialIconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final url = Uri.parse('https://github.com/cua4atro');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Image.asset(
              'assets/images/github-mark-white.png',
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(width: 16.0),
          GestureDetector(
            onTap: () async {
              final url =
                  Uri.parse('https://www.linkedin.com/in/jose-luis-reartes/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/linkedin.png',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
    );
  }
}
