import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/features/music_player/data/models/song_model.dart';
import 'package:on_audio_query/on_audio_query.dart' as audio;

abstract class SongLocalDataSource {
  /// gets all data in the cliend device
  ///
  /// Throws [LocalDataException] when Someting unexcepted hapens
  Future<List<SongModel>> getAllSongsFromLocalStorage();
}

class SongLocalDataSourceImpl implements SongLocalDataSource {
  audio.OnAudioQuery onAudioQuery;

  SongLocalDataSourceImpl(this.onAudioQuery);

  @override
  Future<List<SongModel>> getAllSongsFromLocalStorage() async {
    try {
      final value = await onAudioQuery.querySongs();
      return value.map((e) {
        final map = e.getMap;
        map['artwork'] = onAudioQuery.queryArtwork(e.id, audio.ArtworkType.AUDIO);
        return SongModel.fromMap(Map.from(e.getMap));
      }).toList();
    } on Exception {
      throw LocalDataException();
    }
  }
}
