// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    final bool? success;
    final String? message;
    final User? user;

    UserResponse({
        this.success,
        this.message,
        this.user,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        success: json["success"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
    };
}

class User {
    final String? userId;
    final String? fullName;
    final String? email;
    final String? address;
    final String? role;

    User({
        this.userId,
        this.fullName,
        this.email,
        this.address,
        this.role,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        fullName: json["full_name"],
        email: json["email"],
        address: json["address"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "full_name": fullName,
        "email": email,
        "address": address,
        "role": role,
    };
}
