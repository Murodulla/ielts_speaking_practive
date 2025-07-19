import 'package:flutter/material.dart';

class SimpleHtmlFormatter extends StatelessWidget {
  final String input;

  const SimpleHtmlFormatter({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _parseHtmlLike(
        input
            .replaceAll('<br>', '\n')
            .replaceAll("</u>", "<u>")
            .replaceAll("</p>", "<p>")
            .replaceAll("<p>", "\n"),
      ),
    );
  }

  TextSpan _parseHtmlLike(String text) {
    List<InlineSpan> spans = [];

    final arrowRegex = RegExp(r'<arrow>');
    // final underlineRegex = RegExp(r'<u>(.+?)<\/u>');
    final underlineRegex = RegExp(r'<u>(.+?)<u>');

    int currentIndex = 0;

    while (currentIndex < text.length) {
      final arrowMatch = arrowRegex.matchAsPrefix(text, currentIndex);
      final underlineMatch = underlineRegex.matchAsPrefix(text, currentIndex);

      if (arrowMatch != null) {
        // spans.add(const TextSpan(
        //     text: '+', style: TextStyle(fontWeight: FontWeight.bold)));
        spans.add(const WidgetSpan(
          child: Icon(
            Icons.arrow_right,
            size: 30,
            color: Colors.cyan,
          ),
        ));
        currentIndex += arrowMatch.group(0)!.length;
      } else if (underlineMatch != null) {
        final underlinedText = underlineMatch.group(1)!;
        spans.add(TextSpan(
          text: underlinedText,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            height: 2,
            fontWeight: FontWeight.bold,
          ),
        ));
        currentIndex += underlineMatch.group(0)!.length;
      } else {
        // Add plain text until next special tag
        int nextTag = text.indexOf(RegExp(r'<(arrow|u)>'), currentIndex);
        if (nextTag == -1) nextTag = text.length;
        spans.add(TextSpan(text: text.substring(currentIndex, nextTag)));
        currentIndex = nextTag;
      }
    }

    return TextSpan(
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        children: spans);
  }
}
