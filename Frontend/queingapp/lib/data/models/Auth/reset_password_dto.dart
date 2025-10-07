// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/Auth/reset_password_entity.dart';

class ResetPasswordDto {
  final String password;
  ResetPasswordDto({
    required this.password,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
    };
  }

  factory ResetPasswordDto.fromMap(DocumentSnapshot<Map<String, dynamic>> map, SnapshotOptions? snapShots) {
    return ResetPasswordDto(
      password: map['password'].toString(),
    );
  }


  ResetPasswordEntity toEntity(){
    return ResetPasswordEntity(password: password);
  }

  static ResetPasswordDto fromEntity(ResetPasswordEntity entity){
    return ResetPasswordDto(password: entity.password);
  }
}
