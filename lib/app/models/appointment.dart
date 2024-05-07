// To parse this JSON data, do
//
//     final appointmentResponse = appointmentResponseFromJson(jsonString);

import 'dart:convert';

AppointmentResponse appointmentResponseFromJson(String str) => AppointmentResponse.fromJson(json.decode(str));

String appointmentResponseToJson(AppointmentResponse data) => json.encode(data.toJson());

class AppointmentResponse {
    final bool? success;
    final String? message;
    final List<Appointment>? appointments;

    AppointmentResponse({
        this.success,
        this.message,
        this.appointments,
    });

    factory AppointmentResponse.fromJson(Map<String, dynamic> json) => AppointmentResponse(
        success: json["success"],
        message: json["message"],
        appointments: json["appointments"] == null ? [] : List<Appointment>.from(json["appointments"]!.map((x) => Appointment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x.toJson())),
    };
}

class Appointment {
    final String? appointmentId;
    final DateTime? date;
    final String? doctorId;
    final String? userId;
    final String? problems;
    final String? status;
    final String? id;
    final String? name;
    final String? consultationCharge;
    final String? specializationId;
    final String? avatar;
    final String? experience;
    final String? hospitalId;
    final String? amount;
    final String? details;

    Appointment({
        this.appointmentId,
        this.date,
        this.doctorId,
        this.userId,
        this.problems,
        this.status,
        this.id,
        this.name,
        this.consultationCharge,
        this.specializationId,
        this.avatar,
        this.experience,
        this.hospitalId,
        this.amount,
        this.details,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        appointmentId: json["appointment_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        doctorId: json["doctor_id"],
        userId: json["user_id"],
        problems: json["problems"],
        status: json["status"],
        id: json["id"],
        name: json["name"],
        consultationCharge: json["consultation_charge"],
        specializationId: json["specialization_id"],
        avatar: json["avatar"],
        experience: json["experience"],
        hospitalId: json["hospital_id"],
        amount: json["amount"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "appointment_id": appointmentId,
        "date": date?.toIso8601String(),
        "doctor_id": doctorId,
        "user_id": userId,
        "problems": problems,
        "status": status,
        "id": id,
        "name": name,
        "consultation_charge": consultationCharge,
        "specialization_id": specializationId,
        "avatar": avatar,
        "experience": experience,
        "hospital_id": hospitalId,
        "amount": amount,
        "details": details,
    };
}
