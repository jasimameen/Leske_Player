import 'package:on_audio_query/on_audio_query.dart' as raw;

import '../../domain/entities/song.dart';

class SongModel extends Song {
   SongModel({
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

  factory SongModel.fromRaw(raw.SongModel raw) {
    return SongModel(
      id: raw.id,
      title: raw.title,
      artist: raw.artist ?? "unknown",
      path: raw.data,
      isMusic: raw.isMusic ?? false,
      duration: raw.duration ?? 0,
    );
  }
}
