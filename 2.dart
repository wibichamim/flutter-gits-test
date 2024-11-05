import 'dart:collection';

void main() {
  String input = "{ ( ( [ ] ) [ ] ) [ ] }";
  bool result = isValid(input);
  print(result ? 'YES' : 'NO');
}

bool isValid(String str) {
  Queue<String> stack = Queue<String>();
  Map<String, String> matchingBrackets = {
    '(': ')',
    '{': '}',
    '[': ']',
  };

  for (int i = 0; i < str.length; i++) {
    String char = str[i];

    if (matchingBrackets.keys.contains(char)) {
      stack.addLast(char);
    } else if (matchingBrackets.values.contains(char)) {
      if (stack.isEmpty || matchingBrackets[stack.removeLast()] != char) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}
