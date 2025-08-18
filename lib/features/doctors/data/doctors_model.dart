import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_model.g.dart';

//============================
// 1) Root response wrapper
//============================
@JsonSerializable(explicitToJson: true)
class DoctorsResponseModel {
  final String? message;
  final bool? status;
  final int? code;

  @JsonKey(name: 'data')
  final List<Doctor>? doctors;

  DoctorsResponseModel({
    this.message,
    this.status,
    this.code,
    this.doctors,
  });

  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorsResponseModelToJson(this);
}

//============================
// 2) Doctor entity
//============================
@JsonSerializable(explicitToJson: true)
class Doctor {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;

  final Specialization? specialization;
  final City? city;

  @JsonKey(name: 'appoint_price')
  final int? price;

  @JsonKey(name: 'start_time')
  final String? startTime;

  @JsonKey(name: 'end_time')
  final String? endTime;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.price,
    this.startTime,
    this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

//============================
// 3) Specialization
//============================
@JsonSerializable()
class Specialization {
  final int? id;
  final String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

//============================
// 4) City + Governrate
//============================
@JsonSerializable(explicitToJson: true)
class City {
  final int? id;
  final String? name;
  final Governrate? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Governrate {
  final int? id;
  final String? name;

  Governrate({this.id, this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);
  Map<String, dynamic> toJson() => _$GovernrateToJson(this);
}
