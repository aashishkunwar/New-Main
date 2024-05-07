// To parse this JSON data, do
//
//     final statsResponse = statsResponseFromJson(jsonString);

import 'dart:convert';

StatsResponse statsResponseFromJson(String str) => StatsResponse.fromJson(json.decode(str));

String statsResponseToJson(StatsResponse data) => json.encode(data.toJson());

class StatsResponse {
    final bool? success;
    final String? message;
    final Stats? stats;

    StatsResponse({
        this.success,
        this.message,
        this.stats,
    });

    factory StatsResponse.fromJson(Map<String, dynamic> json) => StatsResponse(
        success: json["success"],
        message: json["message"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "stats": stats?.toJson(),
    };
}

class Stats {
    final String? noOfDoctors;
    final String? totalIncome;
    final String? totalMonthlyIncome;
    final String? totalAppointments;
    final String? totalUsers;

    Stats({
        this.noOfDoctors,
        this.totalIncome,
        this.totalMonthlyIncome,
        this.totalAppointments,
        this.totalUsers,
    });

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        noOfDoctors: json["no_of_doctors"],
        totalIncome: json["totalIncome"],
        totalMonthlyIncome: json["totalMonthlyIncome"],
        totalAppointments: json["totalAppointments"],
        totalUsers: json["totalUsers"],
    );

    Map<String, dynamic> toJson() => {
        "no_of_doctors": noOfDoctors,
        "totalIncome": totalIncome,
        "totalMonthlyIncome": totalMonthlyIncome,
        "totalAppointments": totalAppointments,
        "totalUsers": totalUsers,
    };
}
