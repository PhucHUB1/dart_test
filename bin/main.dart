import 'dart:io';

void main(List<String> arguments) {
  print("Enter your name?");

  // null safety in name string
  String? name = stdin.readLineSync();

  // Printing the name
  print("Hello, $name!");
}
