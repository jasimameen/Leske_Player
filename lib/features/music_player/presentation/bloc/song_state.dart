part of 'song_bloc.dart';

@freezed
class SongState with _$SongState {
  factory SongState({
    required List<Song> songList,
    required Song? currentSong,
    required bool isPlaying,
    required bool isError,
    required bool isLoading,
    required Stream<Duration?> durationStream,
    required Stream<Duration> positionStream,
    required Stream<Duration> buffferPositionStream,
  }) = _SongState;

  factory SongState.initial() => SongState(
        songList: [],
        currentSong: null,
        isPlaying: false,
        isError: false,
        isLoading: false,
        durationStream: Stream.value(Duration.zero),
        positionStream: Stream.value(Duration.zero),
        buffferPositionStream: Stream.value(Duration.zero),
      );
}
