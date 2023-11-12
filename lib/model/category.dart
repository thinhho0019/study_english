class category {
  final int id;
  final String name;

  category({required this.id, required this.name});
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory category.fromMap(Map<dynamic, dynamic> map) {
    return category(id: map['id'] ?? 0, name: map['name'] ?? "");
  }
}
