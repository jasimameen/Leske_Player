// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final String title;
  final String artist;
  final String path;

  final bool isMusic;

  final int duration;

  const Song({
    required this.title,
    required this.artist,
    required this.path,
    required this.isMusic,
    required this.duration,
  });

  @override
  List<Object> get props {
    return [
      title,
      artist,
      path,
      isMusic,
      duration,
    ];
  }
}
