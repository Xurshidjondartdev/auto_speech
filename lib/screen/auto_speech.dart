import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AutoSpeechPage extends StatefulWidget {
  const AutoSpeechPage({super.key});

  @override
  State<AutoSpeechPage> createState() => _AutoSpeechPageState();
}

class _AutoSpeechPageState extends State<AutoSpeechPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
              if (_confidence > 0.5) {}
            }
          }),
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                            color: Colors.white),
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
      ),
    );
  }
}
