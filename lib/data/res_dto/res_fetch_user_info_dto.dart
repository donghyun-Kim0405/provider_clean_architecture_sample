

class ResFetchUserInfoDto {
  final String name;
  final String birth;
  final String age;

//<editor-fold desc="Data Methods">
  const ResFetchUserInfoDto({
    required this.name,
    required this.birth,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResFetchUserInfoDto &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          birth == other.birth &&
          age == other.age);

  @override
  int get hashCode => name.hashCode ^ birth.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'ResFetchUserInfoDto{' +
        ' name: $name,' +
        ' birth: $birth,' +
        ' age: $age,' +
        '}';
  }

  ResFetchUserInfoDto copyWith({
    String? name,
    String? birth,
    String? age,
  }) {
    return ResFetchUserInfoDto(
      name: name ?? this.name,
      birth: birth ?? this.birth,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'birth': this.birth,
      'age': this.age,
    };
  }

  factory ResFetchUserInfoDto.fromMap(Map<String, dynamic> map) {
    return ResFetchUserInfoDto(
      name: map['name'] as String,
      birth: map['birth'] as String,
      age: map['age'] as String,
    );
  }

//</editor-fold>
}