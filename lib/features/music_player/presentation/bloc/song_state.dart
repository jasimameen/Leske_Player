// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'song_bloc.dart';

@freezed
class SongState with _$SongState {
  factory SongState({
    required List<Song> songList,
    required Song? currentSong,
    required Set<int> favorates, // contains song ids
    required bool isPlaying,
    required bool isError,
    required bool isLoading,
    required Stream<PositionStreamData> positionStream,
  }) = _SongState;

  factory SongState.initial() => SongState(
        songList: [],
        currentSong: null,
        favorates: {},
        isPlaying: false,
        isError: false,
        isLoading: false,
        positionStream: const Stream.empty(),
      );
}

// stream model
/// contains current position of the stream
/// ```dart
/// DurationModel(Duration position, Duration bufferedPosition, Duration duration)
/// ```
class PositionStreamData {
  Duration position;
  Duration bufferedPosition;
  Duration? duration;

  PositionStreamData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );
}
