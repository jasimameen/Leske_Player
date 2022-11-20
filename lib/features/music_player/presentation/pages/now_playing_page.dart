import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/presentation/widgets/seek_bar.dart';

import '../bloc/song_bloc.dart';

class NowPlayingPage extends StatelessWidget {
  static const routeName = '/now-playing';
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // gets the passed song when navigating other it will be null
    Song? songArgument = ModalRoute.of(context)!.settings.arguments as Song?;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SongBloc, SongState>(
          buildWhen: (previous, current) {
            final currentSong = songArgument ?? current.currentSong;

            // only rebuilds when the current song changes
            return previous.currentSong != currentSong;
          },
          builder: (context, state) {
            // show passed song when route argument not null.
            // other wise shows the current playing song
            final song = songArgument ?? state.currentSong;
            bool isPlaying = state.isPlaying;

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
                    image: const DecorationImage(
                      // image: MemoryImage(song.albumArt), TODO: show album Art
                      image: NetworkImage(
                          'https://source.unsplash.com/random/900%C3%97700/?lofi'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: FittedBox(
                  //   fit: BoxFit.fitHeight,
                  //   alignment: Alignment.center,
                  //   child: Center(
                  //     child: Icon(Icons.music_note, color: Colors.grey[400]),
                  //   ),
                  // ),
                ),

                // Song Title
                Text(song.title),

                // Seek Slider stream
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SeekBar(
                    positionStream: state.positionStream,
                    bufferPositionStream: state.buffferPositionStream,
                    durationStream: state.durationStream,
                  ),
                ),

                // controller
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // previous song
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        songArgument = null;
                        context
                            .read<SongBloc>()
                            .add(const SongEvent.playPreviousSong());
                      },
                    ),

                    // Play Or Pause
                    IconButton(
                      onPressed: () {
                        songArgument = null;
                        context
                            .read<SongBloc>()
                            .add(SongEvent.playOrPauseSong(song));
                      },
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_outlined
                            : Icons.play_arrow_rounded,
                      ),
                    ),

                    // nextSong
                    IconButton(
                      onPressed: () {
                        songArgument = null;
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
