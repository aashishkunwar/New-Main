// To parse this JSON data, do
//
//     final specializationResponse = specializationResponseFromJson(jsonString);

import 'dart:convert';

SpecializationResponse specializationResponseFromJson(String str) =>
    SpecializationResponse.fromJson(json.decode(str));

String specializationResponseToJson(SpecializationResponse data) =>
    json.encode(data.toJson());

class SpecializationResponse {
  final bool? success;
  final String? message;
  final List<Specialization>? specialization;

  SpecializationResponse({
    this.success,
    this.message,
    this.specialization,
  });

  factory SpecializationResponse.fromJson(Map<String, dynamic> json) =>
      SpecializationResponse(
        success: json["success"],
        message: json["message"],
        specialization: json["specialization"] == null
            ? []
            : List<Specialization>.from(
                json["specialization"]!.map((x) => Specialization.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "specialization": specialization == null
            ? []
            : List<dynamic>.from(specialization!.map((x) => x.toJson())),
      };
}

class Specialization {
  final String? specializationId;
  final String? title;

  Specialization({
    this.specializationId,
    this.title,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        specializationId: json["specialization_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "specialization_id": specializationId,
        "title": title,
      };
}
