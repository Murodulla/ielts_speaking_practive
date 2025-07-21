import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/section_one_view_model.dart';
import '../view_models/section_three_view_model.dart';
import '../view_models/section_two_view_model.dart';
import 'section_one/section_one_view.dart';
import 'section_three/section_three_view.dart';
import 'section_two/section_two_view.dart';

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
              leading: const Icon(
                Icons.mic,
                size: 40,
                color: Colors.white,
              ),
              title: const Text(
                "Part 1",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              tileColor: Colors.purpleAccent,
              contentPadding: const EdgeInsets.all(40),
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
              leading: const Icon(
                Icons.mic,
                size: 40,
                color: Colors.white,
              ),
              title: const Text(
                "Part 2",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              tileColor: Colors.pinkAccent,
              contentPadding: const EdgeInsets.all(40),
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
              leading: const Icon(
                Icons.mic,
                size: 40,
                color: Colors.white,
              ),
              title: const Text(
                "Part 3",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              tileColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(40),
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
