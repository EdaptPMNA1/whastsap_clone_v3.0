// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class FirebaseChat {
  final String uid;
  final String participant;
  final String avatar;
  final String status;
  final String contact;
  final List<Messages> messages;
  FirebaseChat({
    required this.uid,
    required this.participant,
    required this.avatar,
    required this.status,
    required this.contact,
    required this.messages,
  });

  FirebaseChat copyWith({
    String? uid,
    String? participant,
    String? avatar,
    String? status,
    String? contact,
    List<Messages>? messages,
  }) {
    return FirebaseChat(
      uid: uid ?? this.uid,
      participant: participant ?? this.participant,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      contact: contact ?? this.contact,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'participant': participant,
      'avatar': avatar,
      'status': status,
      'contact': contact,
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory FirebaseChat.fromMap(Map<String, dynamic> map) {
    return FirebaseChat(
      uid: map['uid'] as String,
      participant: map['participant'] as String,
      avatar: map['avatar'] as String,
      status: map['status'] as String,
      contact: map['contact'] as String,
      messages: List<Messages>.from(
        (map['messages'] as List<int>).map<Messages>(
          (x) => Messages.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseChat.fromJson(String source) =>
      FirebaseChat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParticipantQsChat(uid: $uid, participant: $participant, avatar: $avatar, status: $status, contact: $contact, messages: $messages)';
  }

  @override
  bool operator ==(covariant FirebaseChat other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.participant == participant &&
        other.avatar == avatar &&
        other.status == status &&
        other.contact == contact &&
        listEquals(other.messages, messages);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        participant.hashCode ^
        avatar.hashCode ^
        status.hashCode ^
        contact.hashCode ^
        messages.hashCode;
  }
}

class Messages {
  final int uid;
  final String message;
  final String sender;
  final DateTime date;
  final bool seen;
  final bool delivered;
  final bool sent;
  final String? image;
  final String? vuideo;
  Messages({
    required this.uid,
    required this.message,
    required this.sender,
    required this.date,
    required this.seen,
    required this.delivered,
    required this.sent,
    this.image,
    this.vuideo,
  });

  Messages copyWith({
    int? uid,
    String? message,
    String? sender,
    DateTime? date,
    bool? seen,
    bool? delivered,
    bool? sent,
    String? image,
    String? vuideo,
  }) {
    return Messages(
      uid: uid ?? this.uid,
      message: message ?? this.message,
      sender: sender ?? this.sender,
      date: date ?? this.date,
      seen: seen ?? this.seen,
      delivered: delivered ?? this.delivered,
      sent: sent ?? this.sent,
      image: image ?? this.image,
      vuideo: vuideo ?? this.vuideo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'message': message,
      'sender': sender,
      'date': date.millisecondsSinceEpoch,
      'seen': seen,
      'delivered': delivered,
      'sent': sent,
      'image': image,
      'vuideo': vuideo,
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      uid: map['uid'] as int,
      message: map['message'] as String,
      sender: map['sender'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      seen: map['seen'] as bool,
      delivered: map['delivered'] as bool,
      sent: map['sent'] as bool,
      image: map['image'] != null ? map['image'] as String : null,
      vuideo: map['vuideo'] != null ? map['vuideo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Messages.fromJson(String source) =>
      Messages.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Messags(uid: $uid, message: $message, sender: $sender, date: $date, seen: $seen, delivered: $delivered, sent: $sent, image: $image, vuideo: $vuideo)';
  }

  @override
  bool operator ==(covariant Messages other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.message == message &&
        other.sender == sender &&
        other.date == date &&
        other.seen == seen &&
        other.delivered == delivered &&
        other.sent == sent &&
        other.image == image &&
        other.vuideo == vuideo;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        message.hashCode ^
        sender.hashCode ^
        date.hashCode ^
        seen.hashCode ^
        delivered.hashCode ^
        sent.hashCode ^
        image.hashCode ^
        vuideo.hashCode;
  }
}

class FirebaseDatabaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> addChat(FirebaseChat chat) async {
    await _database.child('chats').push().set(chat.toMap());
  }
}