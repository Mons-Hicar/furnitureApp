// To parse this JSON data, do
//
// final userServer = userServerFromJson(jsonString);

import 'dart:convert';

List<UserServer> userServerFromJson(String str) =>
    List<UserServer>.from(json.decode(str).map((x) => UserServer.fromJson(x)));

String userServerToJson(List<UserServer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserServer {
  UserServer({
    this.id,
    this.name,
    this.email,
    this.roleId,
    this.verified,
    this.isApproved,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  int roleId;
  int verified;
  int isApproved;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserServer.fromJson(Map<String, dynamic> json) => UserServer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roleId: json["role_id"],
        verified: json["verified"],
        isApproved: json["is_approved"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role_id": roleId,
        "verified": verified,
        "is_approved": isApproved,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
