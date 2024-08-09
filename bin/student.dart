class Student {
  int id;
  String name;
  String phoneNumber;

  Student(this.id, this.name, this.phoneNumber);

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'name': name,
      'phone': phoneNumber,
    };
  }
  static Student fromJson(Map<String,dynamic> json) {
    return Student(json['id'], json['name'], json['phone']);
  }
  @override
  String toString() {
    return 'ID: $id, Name: $name, Phone: $phoneNumber';
  }
}







