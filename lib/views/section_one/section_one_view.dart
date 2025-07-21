import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/section_one_view_model.dart';
import 'section_one_questions_view.dart';

class SectionOneView extends StatefulWidget {
  const SectionOneView({super.key});

  @override
  State<SectionOneView> createState() => _SectionOneViewState();
}

class _SectionOneViewState extends State<SectionOneView> {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<SectionOneViewModel>().isLoading;
    final sectionOneItems = context.read<SectionOneViewModel>().itemsFinal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Part 1"),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : ListView.separated(
              itemCount: sectionOneItems.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SectionOneQuestionsView(
                            item: sectionOneItems[index]),
                      ),
                    );
                  },
                  title: Text(sectionOneItems[index].name),
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  trailing: Text(
                    sectionOneItems[index].sectionOneNew == 'new' ? "new" : '',
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
