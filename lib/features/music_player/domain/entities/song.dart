// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Song extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String path;

  final Uint8List? imageData;

  final bool isMusic;

  final int duration;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.path,
    this.imageData,
    required this.isMusic,
    required this.duration,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      artist,
      path,
      isMusic,
      duration,
    ];
  }
}
