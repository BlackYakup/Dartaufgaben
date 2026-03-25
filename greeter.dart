import 'dart:io';
import 'dart:convert';

void main() {
  String vorname = "";
  while (vorname.isEmpty) {
    stdout.write("Wie lautet der Vorname? ");
    String eingabe = utf8.decode(stdin.readLineSync()!.codeUnits).trim();

    if (eingabe.isEmpty) {
      print("Fehler: Das Feld darf nicht leer sein.");
    } else if (!RegExp(r'^[a-zA-ZäöüÄÖÜß\s\-]+$').hasMatch(eingabe)) {
      print("Fehler: Bitte verwende nur Buchstaben.");
    } else {
      vorname = eingabe;
    }
  }

  String nachname = "";
  while (nachname.isEmpty) {
    stdout.write("Wie lautet der Nachname? ");
    String eingabe = utf8.decode(stdin.readLineSync()!.codeUnits).trim();
    
    if (eingabe.isEmpty) {
      print("Fehler: Das Feld darf nicht leer sein.");
    } else if (!RegExp(r'^[a-zA-ZäöüÄÖÜß\s\-]+$').hasMatch(eingabe)) {
      print("Fehler: Bitte verwende nur Buchstaben.");
    } else {
      nachname = eingabe;
    }
  }

  int? alterZahl;
  while (alterZahl == null) {
    stdout.write("Wie alt bist du? ");
    String eingabe = (stdin.readLineSync() ?? "").trim();

    int? tempAlter = int.tryParse(eingabe);

    if (tempAlter == null) {
      print("Fehler: Bitte gib dein Alter als Zahl ein.");
    } else if (tempAlter < 0) {
      print("Fehler: Das Alter darf nicht negativ sein.");
    } else {
      alterZahl = tempAlter;
    }
  }

  String geschlecht = "";

  while (geschlecht.isEmpty) {
    stdout.write("Und das Geschlecht (Mann/Frau)? ");
    String eingabe = utf8.decode(stdin.readLineSync()!.codeUnits).trim().toLowerCase();

    if (eingabe == "mann" || eingabe == "m" || eingabe == "männlich" || eingabe == "maennlich") {
      geschlecht = "Mann";
    } else if (eingabe == "frau" || eingabe == "w" || eingabe == "weiblich") {
      geschlecht = "Frau";
    } else {
      print("Fehler: Bitte gib z. B. Mann, M, männlich, Frau, w oder weiblich ein.");
    }
  }
  
  DateTime jetzt = DateTime.now();
  int stunde = jetzt.hour;
  String begruessung;

  if (stunde < 12) {
    begruessung = "Guten Morgen";
  } else if (stunde < 18) {
    begruessung = "Guten Tag";
  } else if (stunde < 23) {
    begruessung = "Guten Abend";
  } else {
    begruessung = "Hallo";
  }

  if (alterZahl < 40) {
    print("$begruessung, $vorname.");
  } else {
    String anrede = (geschlecht == "Mann") ? "Herr" : "Frau";
    print("$begruessung, $anrede $nachname.");
  }
}