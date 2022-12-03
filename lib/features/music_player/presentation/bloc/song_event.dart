part of 'song_bloc.dart';

@freezed
class SongEvent with _$SongEvent {
  const factory SongEvent.getLocalSongs() = _GetLocalSongs;
  const factory SongEvent.showSongDetails(Song song) = _ShowSongDetails;
  const factory SongEvent.favorate(Song song) = _Favorate;
  const factory SongEvent.playOrPauseSong(Song song) = _PlayOrPauseSong;
  const factory SongEvent.playNextSong() = _PlayNextSong;
  const factory SongEvent.playPreviousSong() = _PlayPreviousSong;
  const factory SongEvent.seekTo(Duration duration) = _SeekTo;
}
