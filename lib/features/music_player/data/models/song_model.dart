import 'package:music_player/features/music_player/domain/entities/song.dart';

class SongModel extends Song {
  const SongModel({
    required super.title,
    required super.artist,
    required super.path,
    required super.isMusic,
    required super.duration,
  });

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map["title"],
      artist: map["artist"],
      path: map["_data"],
      isMusic: map["is_music"],
      duration: map["duration"] ?? 0,
    );
  }
}
