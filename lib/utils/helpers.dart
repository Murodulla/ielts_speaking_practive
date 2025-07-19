extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable Function(E e) key) => toList()
    ..sort(
      (a, b) => key(a)
          .toString()
          .toLowerCase()
          .compareTo(key(b).toString().toLowerCase()),
    );

  Iterable<E> reversedBy(Comparable Function(E e) key) => toList()
    ..sort(
      (a, b) => key(b)
          .toString()
          .toLowerCase()
          .compareTo(key(a).toString().toLowerCase()),
    );

  Iterable<E> reversedByNumber(Comparable Function(E e) key) => toList()
    ..sort(
      (a, b) => key(b).compareTo(key(a)),
    );

  Iterable<E> sortedByNumber(Comparable Function(E e) key) => toList()
    ..sort(
      (a, b) => key(a).compareTo(key(b)),
    );
}

extension EnumToString on Enum {
  static List<String> toStringList(List<Enum> values) {
    return values.map((e) => e.name).toList();
  }
}

extension StringExtensions on String {
  String phoneFormatterForCall() {
    return removeWhitespace().removeForPhone().replaceAllMapped(
          RegExp(r'(\d{3})(\d{2})(\d{3})(\d{2})(\d+)'),
          (m) => '+${m[1]}${m[2]}${m[3]}${m[4]}${m[5]}',
        );
  }

  String phoneFormatter() {
    return removeWhitespace().removeForPhone().replaceAllMapped(
          RegExp(r'(\d{3})(\d{2})(\d{3})(\d{2})(\d+)'),
          (m) => '+(${m[1]}) ${m[2]} ${m[3]} ${m[4]} ${m[5]}',
        );
  }

  String phoneHiddenFormatter() {
    return removeWhitespace().removeForPhone().replaceAllMapped(
          RegExp(r'(\d{3})(\d{2})(\d{3})(\d{2})(\d+)'),
          (m) => '+(${m[1]}) ${m[2]} *** ** ${m[5]}',
        );
  }

  String cardFormatter() {
    return replaceAllMapped(
      RegExp(r'(\d{4})(\d{4})(\d{4})(\d{4})'),
      (m) => '${m[1]} ${m[2]} ${m[3]} ${m[4]}',
    );
  }

  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  String removeSymbols() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String addQuotes() {
    // Escape existing quotes and backslashes
    replaceAll('"', r'\"');
    replaceAll(r'\\', r'\\\\');

    // Add quotes to keys and values
    replaceAll('{', '{"');
    replaceAll(': ', '": "');
    replaceAll(', ', '", "');
    replaceAll('}', '"}');

    return this;
  }

  String removeForPhone() {
    return replaceAll(RegExp('[+()]'), '');
  }

  String removeImageDatasFromText() {
    return replaceAll('~~~~~', '');
  }

  String cardHiddenFormatter() {
    return replaceAllMapped(
      RegExp(r'(\d{4})(\d{2})(\d{2})(\d{4})(\d{4})'),
      (m) => '${m[1]} ${m[2]}** **** ${m[5]}',
    );
  }
}
