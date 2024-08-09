import 'dart:io';
import'student.dart';
import 'dart:convert';


Future<List<Student>> loadStudents(String filePath) async{
  if(!File(filePath).existsSync()){
    await File(filePath).create();
    await File(filePath).writeAsString(jsonEncode([]));
    return[];
  }

  String content = await File(filePath).readAsString();
  List<dynamic> jsonData = jsonDecode(content);

  return jsonData.map((json) => Student.fromJson(json)).toList();

}
Future<void> addStudent(String filePath, List<Student> studentList) async{
  stdout.write('Nhập tên sinh viên: ');
  String? name = stdin.readLineSync();
  if (name == null) {
    print('Name không hợp lệ');
    return;
  }

  if (!isAlphabet(name)) {
    print('Name không được chứa số');
    return;
  }

  stdout.write('Nhập số điện thoại: ');
  String? phoneNumber = stdin.readLineSync();

  if (phoneNumber == null) {
    print('Phone eNumber không hợp lệ');
    return;
  }

  int id = studentList.isEmpty ? 1: studentList.last.id +1;
  Student student = Student(id, name, phoneNumber);

  //Them sv vao List
  studentList.add(student);
  //them List vao json file
  await saveStudents(filePath, studentList);
}

Future<void> saveStudents(String filePath, List<Student> studentList) async{
  String jsonContent = jsonEncode(studentList.map((s) => s.toJson()).toList());
  await File(filePath).writeAsString(jsonContent);

}

Future<void> displayStudent(String filePath) async {
  List<Student> students = await getAllStudents(filePath);
  if (students.isEmpty) {
    print('Student is empty');
  }
  for (var student in students) {
    print(student);
  }
}
Future<List<Student>> getAllStudents(String filePath) async {
  if (!File(filePath).existsSync()) {
    await File(filePath).create();
    await File(filePath).writeAsString(jsonEncode([]));
    return [];
  }
  String content = await File(filePath).readAsString();
  List<dynamic> jsonData = jsonDecode(content);

  var students = jsonData.map((json) => Student.fromJson(json)).toList();
  return students;
}

Future<void> findStudent(int id) async {

}

Future<void> updateStudent(Student student) async {

}
bool isAlphabet(String str) {
  RegExp alphabet = RegExp(r'^[A-Za-z]+$');
  return alphabet.hasMatch(str);
}