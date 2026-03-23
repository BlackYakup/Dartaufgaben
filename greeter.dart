import 'dart:io';

void main() {
  stdout.write("Wie lautet der Vorname?");
  String? vorname = stdin.readLineSync();

  stdout.write("Wie lautet der Nachname?");
  String? nachname = stdin.readLineSync();

  stdout.write("Wie alt?");
  String? alter = stdin.readLineSync();

  stdout.write("Und das Geschlecht?");
  String? geschlecht = stdin.readLineSync();

  int? alterZahl = int.tryParse(alter!);   

  DateTime jetzt = DateTime.now();
  int stunde = jetzt.hour;
  String begruessung;

  if (stunde < 12) {
    begruessung = "Guten Morgen";
  }
  else if (stunde > 11 && stunde < 18) {
    begruessung = "Guten Tag";
  }
  else if (stunde > 17 && stunde < 23) {
    begruessung = "Guten Abend";
  }
  else {
    begruessung = "Hallo";
  }

  if (alterZahl != null && alterZahl < 40) {
    print("$begruessung, $vorname.");
  }
  else if (alterZahl != null && alterZahl >= 40) {
    if (geschlecht == "Mann") {
      String anrede = "Herr";

      print("$begruessung, $anrede $nachname.");
    } 
    else if (geschlecht == "Frau") {
      String anrede = "Frau";

      print("$begruessung, $anrede $nachname.");
    }
    else {
      print("Es gibt nur zwei Geschlechter. Bitte geben Sie ein, ob Sie männlich oder weiblich sind.");
    }
  }
}