void main(List<String> args) {
  String hello = "Hallo ";

  if (args.isNotEmpty) {
    print(hello + args[0]);
  } else {
    print("Kein Name übergeben.");
  }
}