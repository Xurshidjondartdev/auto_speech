import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpeechToTextExample extends StatelessWidget {
  final double _confidence;
  final String _text;
  final Function _listen;

  const SpeechToTextExample(this._confidence, this._text, this._listen,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/image.png",
            fit: BoxFit.cover,
          ),
        ),
        // Main Content
        Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Speech to Text Example',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _text,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 217, 232, 216),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _listen();
                    },
                    child: SizedBox(
                        height: 180,
                        width: double.maxFinite,
                        child: Lottie.asset('assets/lottie/mic.json')
                        // Image.asset("assets/images/mic2.png"),
                        ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
