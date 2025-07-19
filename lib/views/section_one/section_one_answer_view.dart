import 'package:flutter/material.dart';
import 'package:ielts_speaking_practive/models/section_one.dart';
import 'package:ielts_speaking_practive/utils/simple_html_formatter.dart';
import 'package:ielts_speaking_practive/widgets/list_item_widget.dart';
import 'package:ielts_speaking_practive/widgets/title_widget.dart';

class SectionOneAnswerView extends StatefulWidget {
  final String title;
  final Question item;
  final List<Vocabulary> vocabulary;

  const SectionOneAnswerView(
      {super.key,
      required this.title,
      required this.item,
      required this.vocabulary});

  @override
  State<SectionOneAnswerView> createState() => _SectionOneAnswerViewState();
}

class _SectionOneAnswerViewState extends State<SectionOneAnswerView> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    var questionTexts = widget.item.text.split('#');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: widget.title),
            // Text(widget.item.text),
            // Text(widget.item.questions[1].text),
            for (var item in questionTexts)
              Text(
                '$item\n',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ToggleButtons(
                    constraints: BoxConstraints.expand(
                        width: constraints.maxWidth / 3.5),
                    isSelected: isSelected,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    children: const [
                      Text('Vocabulary'),
                      Text('Ideas'),
                      Text('Answers'),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  isSelected[0]
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var vocabularyItem in widget.vocabulary)
                              ListItemWidget(title: vocabularyItem.text)
                            // for (var vocItem in widget.item.vocabulary)
                            //   Text(vocItem.text),
                          ],
                        )
                      : const SizedBox(),
                  isSelected[1]
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var ideaItem in widget.item.ideas)
                              // Text(
                              //   ideaItem.text,
                              //   style: const TextStyle(
                              //     fontSize: 18,
                              //   ),
                              // )
                              SimpleHtmlFormatter(input: ideaItem.text)
                          ],
                        )
                      : const SizedBox(),
                  isSelected[2]
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var answerItem in widget.item.answer)
                              SimpleHtmlFormatter(
                                input: answerItem.text,
                              )
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
