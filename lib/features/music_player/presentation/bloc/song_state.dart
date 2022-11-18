part of 'song_bloc.dart';

@freezed
class SongState with _$SongState {
  factory SongState({
    required List<Song> songList,
    required Song? currentSong,
    required bool isPlaying,
    required bool isError,
    required bool isLoading,
    required Stream<Duration> positionStream,
  }) = _SongState;

  factory SongState.initial() => SongState(
        songList: [],
        currentSong: null,
        isPlaying: false,
        isError: false,
        isLoading: false,
        positionStream: Stream.value(Duration.zero),
      );
}
