import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/song_bloc.dart';

class NowPlayingPage extends StatelessWidget {
  static const routeName = '/now-playing';
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SongBloc, SongState>(
          buildWhen: (previous, current) {
            // only rebuilds when the current song changes
            return previous.currentSong != current.currentSong;
          },
          builder: (context, state) {
            final song = state.currentSong;

            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }

            if (state.isError || song == null) {
              return const Center(child: Text("Something Went Wrong"));
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // album art
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                    // image: DecorationImage(
                    //   image: MemoryImage(song.albumArt),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                    child: Center(
                      child: Icon(Icons.music_note, color: Colors.grey[400]),
                    ),
                  ),
                ),

                // Song Title
                Text(song.title),

                // Seek Slider stream
                StreamBuilder<Duration>(
                  stream: state.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    return Slider(
                      value: position.inSeconds.toDouble(),
                      min: 0,
                      max: song.duration.toDouble(),
                      onChanged: (value) {
                        BlocProvider.of<SongBloc>(context).add(
                          SongEvent.seekTo(Duration(seconds: value.toInt()),),
                        );
                      },
                    );
                  },
                ),

                // controller
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // previous song
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        context
                            .read<SongBloc>()
                            .add(const SongEvent.playPreviousSong());
                      },
                    ),

                    // Play Or Pause
                    IconButton(
                      onPressed: () {
                        context
                            .read<SongBloc>()
                            .add(SongEvent.playOrPauseSong(song));
                      },
                      icon: Icon(
                        state.isPlaying
                            ? Icons.pause_outlined
                            : Icons.play_arrow_rounded,
                      ),
                    ),

                    // nextSong
                    IconButton(
                      onPressed: () {
                        context
                            .read<SongBloc>()
                            .add(const SongEvent.playNextSong());
                      },
                      icon: const Icon(Icons.skip_next_outlined),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
