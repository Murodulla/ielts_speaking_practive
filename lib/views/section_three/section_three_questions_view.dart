import 'package:flutter/material.dart';

import '../../models/section_three.dart';
import 'section_three_answer_view.dart';

class SectionThreeQuestionsView extends StatefulWidget {
  final SectionThree item;

  const SectionThreeQuestionsView({super.key, required this.item});

  @override
  State<SectionThreeQuestionsView> createState() =>
      _SectionThreeQuestionsViewState();
}

class _SectionThreeQuestionsViewState extends State<SectionThreeQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 3"),
      ),
      body: ListView.separated(
        itemCount: widget.item.questions.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.grey.shade300,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SectionThreeAnswerView(
                    item: widget.item.questions[index],
                    vocabulary: widget.item.vocabulary,
                    title: widget.item.name,
                  ),
                ),
              );
            },
            title:
                Text(widget.item.questions[index].text.replaceAll('#', '\n\n')),
          );
        },
      ),
    );
  }
}
