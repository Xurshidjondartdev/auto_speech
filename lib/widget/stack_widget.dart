import 'package:flutter/material.dart';

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
            "assets/images/fon.png",
            fit: BoxFit.cover,
          ),
        ),
        // Main Content
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.blue,
              centerTitle: true,
              title: const Text('Speech to Text Example'),
            ),
            Center(
              child: Text(
                'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%',
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _text,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                      child: Image.asset("assets/images/mic2.png"),
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
