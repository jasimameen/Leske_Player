// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:music_player/features/music_player/presentation/bloc/song_bloc.dart';

class SeekBar extends StatelessWidget {
  const SeekBar({
    Key? key,
    required this.positionStream,
    required this.durationStream,
    required this.bufferPositionStream,
  }) : super(key: key);

  final Stream<Duration> positionStream;
  final Stream<Duration> bufferPositionStream;
  final Stream<Duration?> durationStream;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          positionStream,
          bufferPositionStream,
          durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        // final durationState = snapshot.data;
        final position = snapshot.data?.position ?? Duration.zero;
        final buffer = snapshot.data?.bufferedPosition ?? Duration.zero;
        final duration = snapshot.data?.duration ?? Duration.zero;
        return ProgressBar(
          // progress: durationState ?? Duration.zero,
          // buffered: bufferPositionStream,
          progress: position,
          buffered: buffer,
          total: duration,
          onSeek: (duration) {
            context.read<SongBloc>().add(SongEvent.seekTo(duration));
          },
        );
      },
    );
  }
}

class PositionData {
  Duration position;
  Duration bufferedPosition;
  Duration duration;

  PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );
}
