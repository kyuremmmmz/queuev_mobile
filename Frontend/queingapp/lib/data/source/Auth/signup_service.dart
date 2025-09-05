
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/Auth/login_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/remote_repository_data_source.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';


class SignUpService implements RemoteRepositoryDataSource{
  final http.Client client;
  final StorageProvider storage;
  SignUpService( {required this.storage ,required this.client});
  @override
  Future<UserDto> createUser(UserDto user) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password ?? '',
          );

      final String uid = credential.user!.uid;
      Map<String, dynamic> userData = user.toJson();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userData);
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      await USER.currentUser?.updateDisplayName(user.name);
      return UserDto.fromJson(
        snapshot,
        null,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<LoginDto> loginUser(LoginDto user) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await DB
          .collection('users')
          .where('username', isEqualTo: user.username)
          .limit(1)
          .get();
      if (querySnapshot.docs.isEmpty) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No account found with that username.',
        );
      }

      final String email = querySnapshot.docs.first.get('email');

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: user.password,
      );

      final String uid = credential.user!.uid;
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      return LoginDto.fromJson(snapshot, null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print('The password is incorrect.');
      } else if (e.code == 'user-not-found') {
        print('No account found with that username.');
      }
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}