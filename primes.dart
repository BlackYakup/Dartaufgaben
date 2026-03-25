import 'dart:io';

void main() {
  int? zahlInt;

  while(zahlInt == null) {
    stdout.write("Gib deine Zahl ein: ");
    String input = stdin.readLineSync()!.trim();

    if (input.isEmpty) {
      print("Fehler: Das Feld darf nicht leer sein.");
    }
    else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
      print("Das war keine gültige Zahl");
    }
    else {
      zahlInt = int.tryParse(input);
    }
  }

  // stdout.write("Gib eine Zahl ein: ");
  // String? zahl = stdin.readLineSync();
  // int? zahlInt = int.tryParse(zahl ?? "");

  // if (zahlInt == null) {
  //   print("Das war keine gültige Zahl!");
  // }

  for(int aktuelleZahl = 1; aktuelleZahl <= zahlInt; aktuelleZahl++) {
    bool isPrime = true;
    
    if (aktuelleZahl <= 1) {
      isPrime = false;
    }
    else {
      for(int i = 2; i * i <= aktuelleZahl; i++) {
        if (aktuelleZahl % i == 0) {
          isPrime = false;
          break;
        }
      }
    }
    
    if (isPrime) {
      print("$aktuelleZahl ist eine Primzahl.");
    }
    else {
      print("$aktuelleZahl ist keine Primzahl.");
    }
  }
}