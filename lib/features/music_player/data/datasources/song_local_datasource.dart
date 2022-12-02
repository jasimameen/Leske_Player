import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/features/music_player/data/models/song_model.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';
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
      final values = await onAudioQuery.querySongs();
      List<SongModel> songList = [];

      values.forEach((e) async {
        final memoryImage =
            await onAudioQuery.queryArtwork(e.id, audio.ArtworkType.AUDIO);
        final SongModel data = SongModel.fromRaw(e);
        data.imageData = memoryImage;
        songList.add(data);
      });

      return songList;
    } on Exception {
      throw LocalDataException();
    }
  }
}
