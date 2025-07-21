import 'package:flutter/material.dart';

import '../../models/section_one.dart';
import 'section_one_answer_view.dart';

class SectionOneQuestionsView extends StatefulWidget {
  final SectionOne item;

  const SectionOneQuestionsView({super.key, required this.item});

  @override
  State<SectionOneQuestionsView> createState() =>
      _SectionOneQuestionsViewState();
}

class _SectionOneQuestionsViewState extends State<SectionOneQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 1"),
      ),
      body: ListView.separated(
        itemCount: widget.item.questions.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          var texts = widget.item.questions[index].text.split("#");
          return ListTile(
            tileColor: Colors.grey.shade300,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SectionOneAnswerView(
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
