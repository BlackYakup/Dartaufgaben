import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print("Nutzung: dart decompress.dart {KOMPRIMIERTER_TEXT}");
    return;
  }

  String input = args[0];
  print(decompress(input));
}

String decompress(String input) {
  String result = "";
  final regExp = RegExp(r'([a-zA-Z])(\d*)');
  final matches = regExp.allMatches(input);

  for(final match in matches) {
    String char = match.group(1)!;
    String countStr = match.group(2)!;

    if(countStr.isEmpty) {
      result += char;
    }
    else {
      int count = int.parse(countStr);
      result += char * count;
    }
  }
  return result;
}