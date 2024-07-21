

class ReqLoginDto {
  final String email;
  final String pwd;

//<editor-fold desc="Data Methods">
  const ReqLoginDto({
    required this.email,
    required this.pwd,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReqLoginDto &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          pwd == other.pwd);

  @override
  int get hashCode => email.hashCode ^ pwd.hashCode;

  @override
  String toString() {
    return 'ReqLoginDto{' + ' email: $email,' + ' pwd: $pwd,' + '}';
  }

  ReqLoginDto copyWith({
    String? email,
    String? pwd,
  }) {
    return ReqLoginDto(
      email: email ?? this.email,
      pwd: pwd ?? this.pwd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'pwd': this.pwd,
    };
  }

  factory ReqLoginDto.fromMap(Map<String, dynamic> map) {
    return ReqLoginDto(
      email: map['email'] as String,
      pwd: map['pwd'] as String,
    );
  }

//</editor-fold>
}