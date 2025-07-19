import 'package:flutter/material.dart';
import 'package:ielts_speaking_practive/view_models/section_one_view_model.dart';
import 'package:ielts_speaking_practive/view_models/section_three_view_model.dart';
import 'package:ielts_speaking_practive/view_models/section_two_view_model.dart';
import 'package:ielts_speaking_practive/views/section_one/section_one_view.dart';
import 'package:ielts_speaking_practive/views/section_three/section_three_view.dart';
import 'package:ielts_speaking_practive/views/section_two/section_two_view.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    context.read<SectionOneViewModel>().loadJson();
    context.read<SectionTwoViewModel>().loadJson();
    context.read<SectionThreeViewModel>().loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SectionOneView(),
                  ),
                );
              },
              title: const DashboardButtonWidget(
                color: Colors.purpleAccent,
                title: "Part 1",
              ),
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SectionTwoView(),
                  ),
                );
              },
              title: const DashboardButtonWidget(
                color: Colors.pinkAccent,
                title: "Part 2",
              ),
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SectionThreeView(),
                  ),
                );
              },
              title: const DashboardButtonWidget(
                color: Colors.blueAccent,
                title: "Part 3",
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DashboardButtonWidget extends StatelessWidget {
  const DashboardButtonWidget({
    super.key,
    required this.color,
    required this.title,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: color,
      ),
      child: Center(
          child: Row(
        children: [
          const Icon(
            Icons.mic,
            size: 100,
            color: Colors.white,
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          const Spacer(flex: 3),
        ],
      )),
    );
  }
}
