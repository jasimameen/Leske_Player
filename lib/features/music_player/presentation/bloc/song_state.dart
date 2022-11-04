part of 'song_bloc.dart';

@freezed
class SongState with _$SongState {
  factory SongState({
    required List<Song> songList,
    required Song? currentSong,
    required bool isPlaying,
    required bool isError,
    required bool isLoading,
  }) = _SongState;

  factory SongState.initial() => SongState(
        songList: [],
        currentSong: null,
        isPlaying: false,
        isError: false,
        isLoading: false,
      );
}
