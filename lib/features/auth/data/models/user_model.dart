import '../../domain/entiyies/user.dart';

class UserModel extends User {
  UserModel({
    required  super.id,
    required  super.name,
    required  super.email,
    required  super.role,
  });


  factory UserModel.fromJson(Map<String, dynamic> json, String id){

    return UserModel(
      id: id, 
      name: json["name"], 
      email: json["email"], 
      role: json["role"]);
  }


  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "email": email,
      "role": role,
    };
  }
}