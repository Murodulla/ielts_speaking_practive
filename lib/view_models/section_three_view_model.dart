import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ielts_speaking_practive/models/section_three.dart';

import '../utils/helpers.dart';

class SectionThreeViewModel extends ChangeNotifier {
  List<SectionThree> itemsFinal = [];
  bool isLoading = false;

  Future<void> loadJson() async {
    isLoading = true;
    // notifyListeners();
    final String response = await rootBundle.loadString('assets/section3.json');
    final data = await json.decode(response);
    final contentMap = data["content"];
    final result = contentMap.values.toList();
    var items = (result as List)
        .map((x) => SectionThree.fromMap(x as Map<String, Object?>))
        .toList();

    var sorted = items.sortedByNumber((e) => e.order).toList();
    itemsFinal = [...sorted];

    isLoading = false;
    notifyListeners();
  }
}
