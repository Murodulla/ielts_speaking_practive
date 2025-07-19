import 'dart:convert';

SectionTwo sectionTwoFromMap(String str) =>
    SectionTwo.fromMap(json.decode(str));

String sectionTwoToMap(SectionTwo data) => json.encode(data.toMap());

class SectionTwo {
  final bool active;
  final List<Answer> answer;
  final bool free;
  final List<Idea> ideas;
  final String name;
  final String sectionTwoNew;
  final int order;
  final List<Answer> questions;
  final List<Answer> vocabulary;

  SectionTwo({
    required this.active,
    required this.answer,
    required this.free,
    required this.ideas,
    required this.name,
    required this.sectionTwoNew,
    required this.order,
    required this.questions,
    required this.vocabulary,
  });

  factory SectionTwo.fromMap(Map<String, dynamic> json) => SectionTwo(
        active: json["active"],
        answer: List<Answer>.from(json["answer"].map((x) => Answer.fromMap(x))),
        free: json["free"],
        ideas: List<Idea>.from(json["ideas"].map((x) => Idea.fromMap(x))),
        name: json["name"],
        sectionTwoNew: json["new"],
        order: json["order"],
        questions:
            List<Answer>.from(json["questions"].map((x) => Answer.fromMap(x))),
        vocabulary:
            List<Answer>.from(json["vocabulary"].map((x) => Answer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "answer": List<dynamic>.from(answer.map((x) => x.toMap())),
        "free": free,
        "ideas": List<dynamic>.from(ideas.map((x) => x.toMap())),
        "name": name,
        "new": sectionTwoNew,
        "order": order,
        "questions": List<dynamic>.from(questions.map((x) => x.toMap())),
        "vocabulary": List<dynamic>.from(vocabulary.map((x) => x.toMap())),
      };
}

class Answer {
  final String text;

  Answer({
    required this.text,
  });

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
      };
}

class Idea {
  final List<Answer> body;
  final String text;

  Idea({
    required this.body,
    required this.text,
  });

  factory Idea.fromMap(Map<String, dynamic> json) => Idea(
        body: List<Answer>.from(json["body"].map((x) => Answer.fromMap(x))),
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "body": List<dynamic>.from(body.map((x) => x.toMap())),
        "text": text,
      };
}
