import 'package:flutter/material.dart';
import 'package:ielts_speaking_practive/view_models/section_three_view_model.dart';
import 'package:ielts_speaking_practive/views/section_three/section_three_questions_view.dart';
import 'package:provider/provider.dart';

class SectionThreeView extends StatefulWidget {
  const SectionThreeView({super.key});

  @override
  State<SectionThreeView> createState() => _SectionThreeViewState();
}

class _SectionThreeViewState extends State<SectionThreeView> {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<SectionThreeViewModel>().isLoading;
    final sectionThreeItems = context.read<SectionThreeViewModel>().itemsFinal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 3"),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : ListView.separated(
              itemCount: sectionThreeItems.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SectionThreeQuestionsView(
                            item: sectionThreeItems[index]),
                      ),
                    );
                  },
                  title: Text(sectionThreeItems[index].name),
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  trailing: Text(
                    sectionThreeItems[index].sectionThreeNew == 'new'
                        ? "new"
                        : '',
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
