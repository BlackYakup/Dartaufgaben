import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();

  List<int> wuerfe = [];
  int maxWuerfe = 0;
  int sechsZaehler = 0;

  while (maxWuerfe <= 0) {
    stdout.write("Wie oft soll maximal gewürfelt werden? ");
    String eingabe = (stdin.readLineSync() ?? "").trim();

    int? temp = int.tryParse(eingabe);

    if (temp == null || temp <= 0) {
      print("Fehler: Bitte gib eine Zahl größer als 0 ein.");
    } else {
      maxWuerfe = temp;
    }
  }

  for (int i = 0; i < maxWuerfe; i++) {
    int wurf = random.nextInt(6) + 1;
    wuerfe.add(wurf);

    print("Wurf ${i + 1}: $wurf");

    if (wurf == 6) {
      sechsZaehler++;

      if (sechsZaehler == 2) {
        print("Zweimal eine 6 gewürfelt!");
        break;
      }
    }
  }

  if (wuerfe.length == maxWuerfe) {
    print("Würfellimit erreicht ($maxWuerfe Würfe).");
  }

  print("\nAlle Würfe: $wuerfe");
}