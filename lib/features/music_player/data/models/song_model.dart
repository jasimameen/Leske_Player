import 'package:music_player/features/music_player/domain/entities/song.dart';

class SongModel extends Song {
  const SongModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.path,
    super.imageData,
    required super.isMusic,
    required super.duration,
  });

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['_id'] ?? 0,
      title: map["title"],
      artist: map["artist"],
      path: map["_data"],
      imageData: map['artwork'],
      isMusic: map["is_music"],
      duration: map["duration"] ?? 0,
    );
  }
}
