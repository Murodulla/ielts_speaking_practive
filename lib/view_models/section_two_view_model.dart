import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/section_two.dart';
import '../utils/helpers.dart';

class SectionTwoViewModel extends ChangeNotifier {
  List<SectionTwo> itemsFinal = [];
  bool isLoading = false;

  Future<void> loadJson() async {
    isLoading = true;
    // notifyListeners();
    final String response = await rootBundle.loadString('assets/section2.json');
    final data = await json.decode(response);
    final contentMap = data["content"];
    final result = contentMap.values.toList();
    var items = (result as List)
        .map((x) => SectionTwo.fromMap(x as Map<String, Object?>))
        .toList();

    var sorted = items.sortedByNumber((e) => e.order).toList();
    itemsFinal = [...sorted];

    isLoading = false;
    notifyListeners();
  }
}
