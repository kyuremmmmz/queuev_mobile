import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Sanitizers {
  String formatPhoneNumber(String phone) {
    String digits = phone.replaceAll(RegExp(r'\D'), '');

    if (digits.startsWith('63')) {
      digits = digits.substring(2);
    } else if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }

    if (digits.length != 10) {
      debugPrint('formatPhoneNumber: Invalid phone number length: $digits');
      return phone;
    }

    return '+63-${digits.substring(0, 3)}-${digits.substring(3, 6)}-${digits.substring(6, 10)}';
  }


String formatTimestamp(dynamic timestamp) {
  DateTime dateTime;

  if (timestamp is Timestamp) {
    dateTime = timestamp.toDate().toLocal();
  } else if (timestamp is String) {
    try {
      final secondsMatch = RegExp(r'seconds=(\d+)').firstMatch(timestamp);
      if (secondsMatch != null) {
        final seconds = int.parse(secondsMatch.group(1)!);
        dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toLocal();
      } else {
        throw FormatException('Invalid timestamp format');
      }
    } catch (e) {
      throw FormatException('Failed to parse timestamp: $e');
    }
  } else {
    throw FormatException('Unsupported timestamp type');
  }

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final messageDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
  if (messageDay == today) {
    return "Today at ${DateFormat.jm().format(dateTime)}";
  } else if (messageDay == yesterday) {
    return "Yesterday at ${DateFormat.jm().format(dateTime)}";
  } else if (dateTime.year == now.year) {
    return DateFormat("MMM d h:mm a").format(dateTime);
  } else {
    return DateFormat("MMM d, yyyy h:mm a").format(dateTime);
  }
}

}