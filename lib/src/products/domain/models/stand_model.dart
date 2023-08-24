class StandModel {
  final int id;
  final String name;

  StandModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory StandModel.fromMap(Map<String, dynamic> map) {
    return StandModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
