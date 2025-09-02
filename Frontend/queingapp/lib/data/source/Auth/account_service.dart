import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/account_repository_data_source.dart';

class AccountService implements AccountRepositoryDataSource{
  @override
  Stream<UserDto?> getUser(String uid) {
    return DB.collection('users').withConverter(fromFirestore: UserDto.fromJson, toFirestore: (UserDto dto, _) => dto.toJson()).where('id', isEqualTo: uid)
        .limit(1)
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isNotEmpty) {
            print('hi: ${snapshot.docs.first.data()}');
            return snapshot.docs.first.data();
          }
          return null;
        });
  }
@override
Future<UserDto> updateAccount(UserDto dto) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) throw Exception('User not authenticated');

    await FirebaseFirestore.instance.collection('users').doc(userId).set(
      dto.toJson(),
      SetOptions(merge: true), 
    );

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
@override
Future<void> deleteAccount() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("No user is signed in.");
      return;
    }
    await user.delete();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();
      print("Account and user data deleted successfully.");
    } catch (firestoreError) {
      print("Firestore error: $firestoreError");
    }
  } on FirebaseAuthException catch (e) {
    print("FirebaseAuthException: ${e.code} - ${e.message}");
  } catch (e) {
    print("Other error: $e");
  }
}

  
}