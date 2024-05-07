// To parse this JSON data, do
//
//     final doctorsResponse = doctorsResponseFromJson(jsonString);

import 'dart:convert';

DoctorsResponse doctorsResponseFromJson(String str) => DoctorsResponse.fromJson(json.decode(str));

String doctorsResponseToJson(DoctorsResponse data) => json.encode(data.toJson());

class DoctorsResponse {
    final bool? success;
    final String? message;
    final List<Doctor>? doctors;

    DoctorsResponse({
        this.success,
        this.message,
        this.doctors,
    });

    factory DoctorsResponse.fromJson(Map<String, dynamic> json) => DoctorsResponse(
        success: json["success"],
        message: json["message"],
        doctors: json["doctors"] == null ? [] : List<Doctor>.from(json["doctors"]!.map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
    };
}

class Doctor {
    final String? id;
    final String? name;
    final String? consultationCharge;
    final String? specializationId;
    final String? avatar;
    final String? experience;
    final String? hospitalId;
    final String? isDeleted;
    final String? title;
    final String? hospitalName;
    final String? hospitalEmail;
    final String? hospitalAddress;

    Doctor({
        this.id,
        this.name,
        this.consultationCharge,
        this.specializationId,
        this.avatar,
        this.experience,
        this.hospitalId,
        this.isDeleted,
        this.title,
        this.hospitalName,
        this.hospitalEmail,
        this.hospitalAddress,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        consultationCharge: json["consultation_charge"],
        specializationId: json["specialization_id"],
        avatar: json["avatar"],
        experience: json["experience"],
        hospitalId: json["hospital_id"],
        isDeleted: json["isDeleted"],
        title: json["title"],
        hospitalName: json["hospital_name"],
        hospitalEmail: json["hospital_email"],
        hospitalAddress: json["hospital_address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "consultation_charge": consultationCharge,
        "specialization_id": specializationId,
        "avatar": avatar,
        "experience": experience,
        "hospital_id": hospitalId,
        "isDeleted": isDeleted,
        "title": title,
        "hospital_name": hospitalName,
        "hospital_email": hospitalEmail,
        "hospital_address": hospitalAddress,
    };
}
