import 'dart:io' show Platform;
import 'package:googleai_dart/googleai_dart.dart';

Future<void> main() async {
  final googleaiApiKey = Platform.environment['GEMINI_KEY_'];
  print("myGeminiKey? : $googleaiApiKey");
  if (googleaiApiKey != null) {
    final client = GoogleAIClient(apiKey: googleaiApiKey);
    final res = await client.generateContent(
      modelId: 'gemini-pro',
      request: const GenerateContentRequest(
        contents: [
          Content(parts: [
            Part(text: 'Where am I?'),
          ]),
        ],
        generationConfig: GenerationConfig(temperature: 0.8),
      ),
    );
    print(res.candidates?.first.content?.parts?.first.text);
  }
}


  // Map<String, String?> _envVars = Platform.environment;
  // final key = _envVars['GEMINI_KEY'];
  // print("envVa : ${_envVars['GEMINI_KEY']}");
  // if (key != null) {
  //   PlamAi.initialize(key);
  // }
  // final client = PlamAi().client;
  // print('PlamAI print $client');
