String capitalizeEachWord(String input) {
  List<String> words = input.split(' ');

  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      words[i] = word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
  }

  return words.join(' ');
}
