// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ParticipantQ {
  final int uid;
  final String avatar;
  final String name;
  final String messageFrom;
  final String lastMessage;
  final bool isImage;
  final bool sent;
  final bool delivered;
  final int unread;
  final bool seen;
  final String date;
  
  ParticipantQ({
    required this.uid,
    required this.avatar,
    required this.name,
    required this.messageFrom,
    required this.lastMessage,
    required this.isImage,
    required this.sent,
    required this.delivered,
    required this.unread,
    required this.seen,
    required this.date,
  });

  ParticipantQ copyWith({
    int? uid,
    String? avatar,
    String? name,
    String? messageFrom,
    String? lastMessage,
    bool? isImage,
    bool? sent,
    bool? delivered,
    int? unread,
    bool? seen,
    String? date,
  }) {
    return ParticipantQ(
      uid: uid ?? this.uid,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      messageFrom: messageFrom ?? this.messageFrom,
      lastMessage: lastMessage ?? this.lastMessage,
      isImage: isImage ?? this.isImage,
      sent: sent ?? this.sent,
      delivered: delivered ?? this.delivered,
      unread: unread ?? this.unread,
      seen: seen ?? this.seen,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'avatar': avatar,
      'name': name,
      'messageFrom': messageFrom,
      'lastMessage': lastMessage,
      'isImage': isImage,
      'sent': sent,
      'delivered': delivered,
      'unread': unread,
      'seen': seen,
      'date': date,
    };
  }

  factory ParticipantQ.fromMap(Map<String, dynamic> map) {
    return ParticipantQ(
      uid: map['uid'] as int,
      avatar: map['avatar'] as String,
      name: map['name'] as String,
      messageFrom: map['messageFrom'] as String,
      lastMessage: map['lastMessage'] as String,
      isImage: map['isImage'] as bool,
      sent: map['sent'] as bool,
      delivered: map['delivered'] as bool,
      unread: map['unread'] as int,
      seen: map['seen'] as bool,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantQ.fromJson(String source) =>
      ParticipantQ.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParticipantQ(uid: $uid, avatar: $avatar, name: $name, messageFrom: $messageFrom, lastMessage: $lastMessage, isImage: $isImage, sent: $sent, delivered: $delivered, unread: $unread, seen: $seen, date: $date)';
  }

  @override
  bool operator ==(covariant ParticipantQ other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.avatar == avatar &&
        other.name == name &&
        other.messageFrom == messageFrom &&
        other.lastMessage == lastMessage &&
        other.isImage == isImage &&
        other.sent == sent &&
        other.delivered == delivered &&
        other.unread == unread &&
        other.seen == seen &&
        other.date == date;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        avatar.hashCode ^
        name.hashCode ^
        messageFrom.hashCode ^
        lastMessage.hashCode ^
        isImage.hashCode ^
        sent.hashCode ^
        delivered.hashCode ^
        unread.hashCode ^
        seen.hashCode ^
        date.hashCode;
  }
}
