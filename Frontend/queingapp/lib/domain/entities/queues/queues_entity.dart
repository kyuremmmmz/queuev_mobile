// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class QueuesEntity {
  final String? documentReference;
  final String? catId;
  final String name;
  final String? uid;
  final String type;
  final int index;
  final Timestamp? schedule;
  final Timestamp? timein;
  final String address;
  final String note;
  final String? status;
  QueuesEntity({
    this.documentReference,
    this.catId,
    required this.name,
    this.uid,
    required this.status,
    required this.type,
    required this.index,
    this.schedule,
    this.timein,
    required this.address,
    required this.note,
  });
}
