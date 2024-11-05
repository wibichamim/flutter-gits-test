void main() {
  String input = "abbcccd";
  List<int> queries = [1, 3, 9, 8];
  List<String> result = checkQueries(input, queries);

  print(result);
}

List<String> checkQueries(String str, List<int> queries) {
  Set<int> weights = getStringWeights(str);
  List<String> results = [];

  for (int query in queries) {
    results.add(weights.contains(query) ? 'Yes' : 'No');
  }

  return results;
}

Set<int> getStringWeights(String str) {
  Set<int> weights = {};
  int length = str.length;

  for (int i = 0; i < length; i++) {
    int currWeight = 0;
    for (int j = i; j < length && str[j] == str[i]; j++) {
      currWeight = currWeight + (str[i].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1);
      weights.add(currWeight);
    }
  }

  return weights;
}
