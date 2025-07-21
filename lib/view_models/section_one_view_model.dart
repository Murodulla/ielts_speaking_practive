import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/section_one.dart';
import '../utils/helpers.dart';

class SectionOneViewModel extends ChangeNotifier {
  List<SectionOne> itemsFinal = [];
  bool isLoading = false;

  Future<void> loadJson() async {
    isLoading = true;
    // notifyListeners();
    final String response = await rootBundle.loadString('assets/section1.json');
    final data = await json.decode(response);
    final contentMap = data["content"];
    final result = contentMap.values.toList();
    var items = (result as List)
        .map((x) => SectionOne.fromMap(x as Map<String, Object?>))
        .toList();

    var sorted = items.sortedByNumber((e) => e.order).toList();
    itemsFinal = [...sorted];

    isLoading = false;
    notifyListeners();
  }
}
