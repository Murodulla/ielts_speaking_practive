import 'dart:convert';

SectionThree sectionThreeFromMap(String str) =>
    SectionThree.fromMap(json.decode(str));

String sectionThreeToMap(SectionThree data) => json.encode(data.toMap());

class SectionThree {
  final bool active;
  final bool free;
  final String name;
  final String sectionThreeNew;
  final int order;
  final List<Question> questions;
  final List<Vocabulary> vocabulary;

  SectionThree({
    required this.active,
    required this.free,
    required this.name,
    required this.sectionThreeNew,
    required this.order,
    required this.questions,
    required this.vocabulary,
  });

  factory SectionThree.fromMap(Map<String, dynamic> json) => SectionThree(
        active: json["active"],
        free: json["free"],
        name: json["name"],
        sectionThreeNew: json["new"],
        order: json["order"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromMap(x))),
        vocabulary: List<Vocabulary>.from(
            json["vocabulary"].map((x) => Vocabulary.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "free": free,
        "name": name,
        "new": sectionThreeNew,
        "order": order,
        "questions": List<dynamic>.from(questions.map((x) => x.toMap())),
        "vocabulary": List<dynamic>.from(vocabulary.map((x) => x.toMap())),
      };
}

class Question {
  final List<Vocabulary> answer;
  final List<Vocabulary> ideas;
  final String text;

  Question({
    required this.answer,
    required this.ideas,
    required this.text,
  });

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        answer: List<Vocabulary>.from(
            json["answer"].map((x) => Vocabulary.fromMap(x))),
        ideas: List<Vocabulary>.from(
            json["ideas"].map((x) => Vocabulary.fromMap(x))),
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "answer": List<dynamic>.from(answer.map((x) => x.toMap())),
        "ideas": List<dynamic>.from(ideas.map((x) => x.toMap())),
        "text": text,
      };
}

class Vocabulary {
  final String text;

  Vocabulary({
    required this.text,
  });

  factory Vocabulary.fromMap(Map<String, dynamic> json) => Vocabulary(
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
      };
}
