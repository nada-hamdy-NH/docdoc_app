class Info {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  Info({this.id, this.name, this.email, this.phone, this.gender});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        gender: json['gender'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
      };
}
