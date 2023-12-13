import 'package:flutter/material.dart';

// LeafREnderObjectWidget : if there is no Widget passed as parameter
class WeatherButtonOneLeaf extends LeafRenderObjectWidget {
  WeatherButtonOneLeaf({
    super.key,
    required this.text,
  });
  final String text;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return WeatherButtonOneRenderObject(newText: text);
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant WeatherButtonOneRenderObject renderObject) {
    // super.updateRenderObject(context, renderObject);
    renderObject.text = text;
  }
}

class WeatherButtonOneRenderObject extends RenderBox {
  WeatherButtonOneRenderObject({
    required String newText,
  }) {
    _text = newText;
  }
  late String _text;
  String get text => _text;
  set text(String newText) {
    if (_text == newText) {
      return;
    }
    _text = text;
  }
}
