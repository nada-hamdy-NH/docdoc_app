
import 'package:docdoc/core/helper/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: "data")
  final Map? errors ;
  ApiErrorModel({this.message, this.code , this.errors});


factory ApiErrorModel.fromjson(Map<String, dynamic> json)=>
_$ApiErrorModelFromJson(json);

Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

///return a string contain all error masseges
 allErrorMasseges(){
  if(errors.isNullOrEmpty()) return message ?? "UnKnown Error Occured";
  final errorMessages  = errors!.entries.map((entry){
    final value = entry.value ; 
    return "${value.join(",")}";
  }).join("\n");
  
  return errorMessages;

}
}