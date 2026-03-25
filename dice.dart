import 'dart:math';

void main() {
  Random random = Random();

  List<int> wuerfe = [];
  int maxWuerfe = 10;
  int sechsZaehler = 0;

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
    print("Würfellimit erreicht (10 Würfe).");
  }

  print("\nAlle Würfe: $wuerfe");
}