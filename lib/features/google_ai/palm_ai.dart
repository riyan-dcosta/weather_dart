import 'package:googleai_dart/googleai_dart.dart';

class PlamAiEexcption implements Exception {
  String message;
  PlamAiEexcption(this.message);
}

class PlamAi {
  PlamAi._internal();

  static final PlamAi _instance = PlamAi._internal();
  GoogleAIClient? client;
  factory PlamAi.initialize(String apiKey) {
    _instance.client = GoogleAIClient(apiKey: apiKey);
    return _instance;
  }
  factory PlamAi() {
    assert(_instance.client != null);
    print("plamAI() assert success");
    if (_instance.client == null) {
      throw PlamAiEexcption("Client is not initialized");
    }
    print("plamAI() client null check success.");
    return _instance;
  }
}
