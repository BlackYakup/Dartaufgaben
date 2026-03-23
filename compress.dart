import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print("Bitte gib einen String als Argument an");
    return;
  }

  String input = args[0];
  try {
    print(compress(input));
  }
  catch(e) {
    print("Fehler ${e.toString()}");
  }
}

// Compress Funktion

String compress(String input) {
  if (input.isEmpty) return "";

  if(!RegExp(r'^[a-zA-Z]+$').hasMatch(input)) {
    throw ArgumentError("String darf nur Buchstaben enthalten");
  }

  String result = "";
  int count = 1;

  for(int i = 0; i < input.length; i++) {
    if (i + 1 < input.length && input[i] == input[i + 1]) {
      count++;
    }
    else {
      if (count >= 3) {
        result += "${input[i]}$count";
      }
      else {
        result += input[i] * count;
      }
      count = 1;
    }
  }
  return result;
}