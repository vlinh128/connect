// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActivityEntity {
  String? id;
  String createdBy;
  String name;
  String description;
  String locationDesc;
  DateTime startTime;
  DateTime? endTime;
  String gender;
  List<String> tags;
  double lat;
  double long;
  List<String>? images;
  DateTime createdAt;
  DateTime updatedAt;

  ActivityEntity({
    required this.id,
    required this.createdBy,
    required this.name,
    required this.description,
    required this.locationDesc,
    required this.startTime,
    required this.endTime,
    required this.gender,
    required this.tags,
    required this.lat,
    required this.long,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  ActivityEntity copyWith({
    String? id,
    String? createdBy,
    String? name,
    String? description,
    String? locationDesc,
    DateTime? startTime,
    DateTime? endTime,
    String? gender,
    List<String>? tags,
    double? lat,
    double? long,
    List<String>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ActivityEntity(
      id: id ?? this.id,
      createdBy: createdBy ?? this.createdBy,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      description: description ?? this.description,
      locationDesc: locationDesc ?? this.locationDesc,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      gender: gender ?? this.gender,
      tags: tags ?? this.tags,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "lat": lat,
      "long": long,
      'createdBy': createdBy,
      'locationDesc': locationDesc,
      'name': name,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'gender': gender,
      'tags': tags,
      'images': images ?? [],
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ActivityEntity.fromMap(Map<String, dynamic> map) {
    return ActivityEntity(
      id: null,
      createdBy: map['createdBy'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      locationDesc: map['locationDesc'] as String,
      startTime: map['startTime'],
      endTime: map['endTime'],
      gender: map['gender'] as String,
      tags: map['tags'] as List<String>,
      lat: map['lat'] as double,
      long: map['long'] as double,
      images: ((map['images'] ?? []) as List<dynamic>).cast(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  factory ActivityEntity.fromMapFs(Map<String, dynamic> map) {
    return ActivityEntity(
      id: map['id'],
      createdBy: map['createdBy'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      locationDesc: map['locationDesc'] as String,
      startTime: (map['startTime'] as Timestamp).toDate(),
      endTime: (map['endTime'] as Timestamp).toDate(),
      gender: map['gender'] as String,
      tags: (map['tags'] as List<dynamic>).cast(),
      lat: map['lat'] as double,
      long: map['long'] as double,
      images: ((map['images'] ?? []) as List<dynamic>).cast(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityEntity.fromJson(String source) =>
      ActivityEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityEntity(createdBy: $createdBy,lat: $lat, long: $long,  name: $name, description: $description, startTime: $startTime, endTime: $endTime, gender: $gender, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ActivityEntity other) {
    if (identical(this, other)) return true;

    return other.createdBy == createdBy &&
        other.name == name &&
        other.description == description &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.lat == lat &&
        other.long == long &&
        other.gender == gender &&
        listEquals(other.tags, tags) &&
        listEquals(other.images, images) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return createdBy.hashCode ^
        name.hashCode ^
        description.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        gender.hashCode ^
        tags.hashCode ^
        images.hashCode ^
        createdAt.hashCode ^
        lat.hashCode ^
        long.hashCode ^
        updatedAt.hashCode;
  }
}
