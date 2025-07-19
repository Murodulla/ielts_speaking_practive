import 'package:flutter/material.dart';
import 'package:ielts_speaking_practive/models/section_two.dart';
import 'package:ielts_speaking_practive/utils/simple_html_formatter.dart';
import 'package:ielts_speaking_practive/widgets/list_item_widget.dart';
import 'package:ielts_speaking_practive/widgets/title_widget.dart';

class SectionTwoAnswerView extends StatefulWidget {
  final SectionTwo item;

  const SectionTwoAnswerView({super.key, required this.item});

  @override
  State<SectionTwoAnswerView> createState() => _SectionTwoAnswerViewState();
}

class _SectionTwoAnswerViewState extends State<SectionTwoAnswerView> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    var questionTexts = widget.item.questions[2].text.split('#');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: widget.item.name),
            Text(
              widget.item.questions[0].text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.item.questions[1].text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            for (var item in questionTexts) ListItemWidget(title: item),
            const SizedBox(height: 10),
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
                            for (var vocItem in widget.item.vocabulary)
                              // Text(vocItem.text),
                              ListItemWidget(
                                title: vocItem.text,
                                color: Colors.greenAccent,
                              )
                          ],
                        )
                      : const SizedBox(),
                  isSelected[1]
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var ideaItem in widget.item.ideas)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: Colors.cyanAccent,
                                    child: Text(
                                      ideaItem.text,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  for (var vocIdeaBody in ideaItem.body)
                                    SimpleHtmlFormatter(
                                      input: vocIdeaBody.text,
                                    ),
                                ],
                              ),
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
                              ),
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
