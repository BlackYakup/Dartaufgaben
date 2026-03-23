import 'dart:io';

void main() {
  stdout.write("Gib eine Zahl ein: ");
  String? zahl = stdin.readLineSync();
  int? zahlInt = int.tryParse(zahl ?? "");

  if (zahlInt == null) {
    print("Das war keine gültige Zahl!");
    return;
  }

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