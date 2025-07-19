import 'package:flutter/material.dart';
import 'package:ielts_speaking_practive/view_models/section_one_view_model.dart';
import 'package:ielts_speaking_practive/view_models/section_three_view_model.dart';
import 'package:ielts_speaking_practive/view_models/section_two_view_model.dart';
import 'package:ielts_speaking_practive/views/dashboard_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SectionOneViewModel>(
          create: (context) => SectionOneViewModel(),
        ),
        ChangeNotifierProvider<SectionTwoViewModel>(
          create: (context) => SectionTwoViewModel(),
        ),
        ChangeNotifierProvider<SectionThreeViewModel>(
          create: (context) => SectionThreeViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'IELTS Speaking Practice',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const SectionTwoView(title: ''),
        home: const DashboardView(),
      ),
    );
  }
}
