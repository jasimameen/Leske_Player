part of 'song_bloc.dart';

@freezed
class SongEvent with _$SongEvent {
  const factory SongEvent.getLocalSongs() = _GetLocalSongs;
  const factory SongEvent.playOrPauseSong(Song song) = _PlayOrPauseSong;
  
}
