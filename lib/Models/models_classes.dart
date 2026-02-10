class ModelsClasses {
  final int? id;
  final String name;
  final int age;

  ModelsClasses({required this.name, required this.age, this.id});

  factory ModelsClasses.fromMap(Map<String, dynamic> map) {
    return ModelsClasses(id: map['id'], name: map['name'], age: map['age']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }
}
