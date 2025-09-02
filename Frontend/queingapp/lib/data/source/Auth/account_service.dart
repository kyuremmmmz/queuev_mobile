import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/account_repository_data_source.dart';

class AccountService implements AccountRepositoryDataSource{
  @override
  Stream<UserDto> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
@override
Future<UserDto> updateAccount(UserDto dto) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) throw Exception('User not authenticated');

    // Update in Firestore
    await FirebaseFirestore.instance.collection('users').doc(userId).set(
      dto.toJson(),
      SetOptions(merge: true), 
    );

    // Retrieve updated data
    final DocumentSnapshot<Map<String, dynamic>> dtos = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (!dtos.exists) throw Exception('User document does not exist');

    return UserDto.fromJson(dtos, null);
  } catch (e) {
    print('Error updating account: $e');
    rethrow;
  }
}
  
}