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
  }) : super(key: key);

  final Stream<PositionStreamData> positionStream;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder<PositionStreamData>(
          stream: positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data?.position ?? Duration.zero;
            final buffer = snapshot.data?.bufferedPosition ?? Duration.zero;
            final duration = snapshot.data?.duration ?? Duration.zero;
            return Column(
              children: [
                // seekbar
                ProgressBar(
                  progress: position,
                  buffered: buffer,
                  total: duration,
                  onSeek: (duration) {
                    context.read<SongBloc>().add(SongEvent.seekTo(duration));
                  },
                  baseBarColor: Colors.grey.withOpacity(0.2),
                  progressBarColor: Theme.of(context).primaryColor,
                  thumbColor: Theme.of(context).primaryColor,
                ),
              ],
            );
          }),
    );
  }
}
