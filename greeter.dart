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
    alterZahl = int.tryParse(eingabe);
    if (alterZahl == null) {
      print("Fehler: Bitte gib dein Alter als Zahl ein.");
    }
  }

  String geschlecht = "";
  while (geschlecht != "Mann" && geschlecht != "Frau") {
    stdout.write("Und das Geschlecht (Mann/Frau)? ");
    String eingabe = (stdin.readLineSync() ?? "").trim();
    
    if (eingabe == "Mann" || eingabe == "Frau") {
      geschlecht = eingabe;
    } else {
      print("Fehler: Bitte gib exakt 'Mann' oder 'Frau' ein.");
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