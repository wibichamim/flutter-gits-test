void main() {
  String s = "932239";
  int k = 2;
  String result = highestPalindrome(s, k);
  print(result);
}

String highestPalindrome(String s, int k) {
  List<String> arr = s.split('');
  int n = arr.length;

  bool result = palindrome(arr, 0, n - 1, k);
  return result ? highPalindrome(arr, k) : "-1";
}

bool palindrome(List<String> arr, int start, int end, int k) {
  if (k < 0) return false;
  if (start >= end) return true;

  if (arr[start] != arr[end]) {
    int maxDigit = (arr[start].compareTo(arr[end]) > 0)
        ? int.parse(arr[start])
        : int.parse(arr[end]);
    maxDigit = 9;

    arr[start] = arr[end] = maxDigit.toString();

    return palindrome(arr, start + 1, end - 1, k - 1);
  } else {
    return palindrome(arr, start + 1, end - 1, k);
  }
}

String highPalindrome(List<String> arr, int k) {
  int i = 0, j = arr.length - 1;

  while (i <= j && k > 0) {
    if (arr[i] != '9') {
      if (i == j && k >= 1) {
        arr[i] = '9';
        k--;
      } else if (k >= 2 && arr[i] == arr[j]) {
        arr[i] = arr[j] = '9';
        k -= 2;
      } else if (k >= 1 &&
          arr[i] != arr[j] &&
          (arr[i] == '9' || arr[j] == '9')) {
        arr[i] = arr[j] = '9';
        k--;
      }
    }
    i++;
    j--;
  }

  return arr.join();
}
