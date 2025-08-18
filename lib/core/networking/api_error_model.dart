import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: "data")
  final dynamic errors; // بدل Map؟ خليها dynamic

  ApiErrorModel({this.message, this.code, this.errors});

  factory ApiErrorModel.fromjson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// return a string containing all error messages
  String allErrorMasseges() {
    if (errors == null) return message ?? "Unknown Error Occurred";

    if (errors is Map) {
      if ((errors as Map).isEmpty) {
        return message ?? "Unknown Error Occurred";
      }
      final errorMessages = (errors as Map).entries.map((entry) {
        final value = entry.value;
        if (value is List) {
          return value.join(",");
        }
        return value.toString();
      }).join("\n");
      return errorMessages;
    }

    if (errors is List) {
      if ((errors as List).isEmpty) {
        return message ?? "Unknown Error Occurred";
      }
      return (errors as List).join(",");
    }

    return errors.toString();
  }
}
