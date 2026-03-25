import 'dart:developer';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  String input = "";

  if (args.isNotEmpty) {
    input = args[0].trim();
  }

  bool erfolgreich = false;

  while (!erfolgreich) {
    if (input.isEmpty) {
      stdout.write("Bitte gib den komprimierten Text ein: ");
      input = utf8.decode(stdin.readLineSync()!.codeUnits).trim();
    }

    try {
      String ergebnis = decompress(input);
      print("Dekomprimiertes Ergebnis: $ergebnis");
      
      erfolgreich = true; 
    } catch (e) {
      print("Fehler: ${e.toString()}");
      
      input = ""; 
    }
  }
}

String decompress(String input) {
  if (!input.contains(RegExp(r'[a-zA-ZäöüÄÖÜß]'))) {
    throw ArgumentError("Ungültiger komprimierter String: Muss Buchstaben enthalten.");
  }

  String result = "";
  final regExp = RegExp(r'([a-zA-ZäöüÄÖÜß])(\d*)');
  final matches = regExp.allMatches(input);

  for (final match in matches) {
    String char = match.group(1)!;
    String countStr = match.group(2)!;
    log("${char}, ${matches}");
    if (countStr.isEmpty) {
      result += char;
    } else {
      int count = int.parse(countStr);
      result += char * count;
    }
  }
  return result;
}