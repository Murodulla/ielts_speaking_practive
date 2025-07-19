import 'package:flutter/material.dart';
import 'package:ielts_speaking_practive/view_models/section_two_view_model.dart';
import 'package:ielts_speaking_practive/views/section_two/section_two_answer_view.dart';
import 'package:provider/provider.dart';

class SectionTwoView extends StatefulWidget {
  const SectionTwoView({super.key});

  @override
  State<SectionTwoView> createState() => _SectionTwoViewState();
}

class _SectionTwoViewState extends State<SectionTwoView> {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<SectionTwoViewModel>().isLoading;
    final sectionTwoItems = context.read<SectionTwoViewModel>().itemsFinal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 2"),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : ListView.separated(
              itemCount: sectionTwoItems.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SectionTwoAnswerView(item: sectionTwoItems[index]),
                      ),
                    );
                  },
                  title: Text(sectionTwoItems[index].name),
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  trailing: Text(
                    sectionTwoItems[index].sectionTwoNew == 'new' ? "new" : '',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
