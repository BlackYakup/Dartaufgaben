import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  String textToCompress = "";
  String ergebnis = "";

  if (args.isNotEmpty) {
    textToCompress = args[0].trim();
  }

  while (ergebnis.isEmpty) {
    
    if (textToCompress.isEmpty) {
      stdout.write("Bitte gib einen Text zum Komprimieren ein: ");
      textToCompress = utf8.decode(stdin.readLineSync()!.codeUnits).trim();
    }

    if (textToCompress.isEmpty) {
      print("Fehler: Die Eingabe darf nicht leer sein!");
      continue; 
    }
 
    try {
      ergebnis = compress(textToCompress);
      print("Ergebnis: $ergebnis");
    } catch (e) {
      print("Fehler: ${e.toString()}");
      
      textToCompress = ""; 
    }
  }
}

// Compress Funktion

String compress(String input) {
  if (input.isEmpty) return "";

  if(!RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(input)) {
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