import 'package:flutter/widgets.dart';

// LeafREnderObjectWidget : if there is no Widget passed as parameter
class WeatherButtonOneLeaf extends LeafRenderObjectWidget {
  const WeatherButtonOneLeaf({
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
    // TODO, TextPainter needs text direction, watch video again.
    _textPainter = TextPainter(text: TextSpan(text: _text));
  }

  late String _text;
  late TextPainter _textPainter;
  TextSpan get textSpan => TextSpan(text: _text);

  String get text => _text;
  set text(String newText) {
    if (_text == newText) {
      return;
    }
    _text = text;
    _textPainter.text = textSpan;
  }

  @override
  void performLayout() {
    // super.performLayout();
    _textPainter.layout(maxWidth: constraints.maxWidth);
    final textSize = _textPainter.computeLineMetrics();
    late Size computedSize;
    computedSize = Size(textSize.last.width, textSize.last.height);
    size = constraints.constrain(computedSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // super.paint(context, offset);
    _textPainter.paint(context.canvas, offset);
  }
}
