import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  String uid;
  String title;
  String content;
  Timestamp? createdAt; // Make createdAt nullable

  Note({
    required this.id,
    required this.uid,
    required this.title,
    required this.content,
    this.createdAt, // Allow createdAt to be nullable
  });

  Note copyWith({
    String? id,
    String? uid,
    String? title,
    String? content,
    Timestamp? createdAt,
  }) {
    return Note(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'title': title,
      'content': content,
      'createdAt': createdAt, // Null is allowed here
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] as Timestamp?, // createdAt can be null
    );
  }

  factory Note.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    var map = snapshot.data()!;
    map.addAll({'id': snapshot.id});
    return Note.fromMap(map);
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, uid: $uid, title: $title, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.uid == uid &&
        other.title == title &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        title.hashCode ^
        content.hashCode ^
        createdAt.hashCode;
  }
}
