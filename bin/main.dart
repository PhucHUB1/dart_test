import 'dart:io';
import 'package:path/path.dart' as p;
import 'student_service.dart';
import 'student.dart';

void main() async {
  const String fileName = 'students.json';
  final String directoryPath = p.join(Directory.current.path,'data');
  final Directory directory = Directory(directoryPath);

  if(!await directory.exists()){
    await directory.create(recursive: true);
  }
  final String filePath = p.join(directoryPath,fileName);
  List<Student> studentList = await loadStudents(filePath);

  while (true) {
    stdout.write('''
    Menu:
    1. Thêm sinh viên
    2. Hiển thị danh sách sinh viên
    3. Tìm sinh viên theo tên hoặc ID
    4. Sửa thông tin sinh viên
    5. Xem điểm cao nhất
    6. Thoát
    Vui lòng chọn số: ''');

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        addStudent(filePath, studentList);
        break;
      case '2':
        displayStudent(filePath);
        break;
      case'3':
        stdout.write('''
        Find Student By:
        1. ID
        2. Name
       Vui lòng chọn số: ''');
        String? choice = stdin.readLineSync();
        switch (choice) {
          case '1':
            findStudentById();
            break;
          case '2':
            findStudentByName();
            break;
          default:
            print('Invalid number');
            break;
        }
        break;
      case'4':
          updateStudent();
        break;
      case'5':
          getStudentHighestScore();
        break;
      case '6':
        print('Thoát chương trình');
        exit(0);
      default:
        print('Chọn sai, vui lòng chọn lại');
    }
  }
}