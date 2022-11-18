import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music_player/presentation/pages/now_playing_page.dart';

import '../bloc/song_bloc.dart';

class AllSongsPage extends StatelessWidget {
  static const routeName = "/all-songs";
  const AllSongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SongBloc>(context).add(const SongEvent.getLocalSongs());
    });

    return Scaffold(
      appBar: AppBar(title: const Text("All Songs")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SongBloc, SongState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }

            if (state.isError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            return ListView.builder(
              itemCount: state.songList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final song = state.songList[index];
                final isPlaying = state.currentSong == song;
                return ListTile(
                  
                  // album art
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 3,
                          spreadRadius: 2,
                        ),
                      ],
                      // image: DecorationImage(
                      //   image: MemoryImage(song.albumArt),
                      //   fit: BoxFit.cover,
                      // ),
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                      child: Center(
                        child: Icon(Icons.music_note, color: Colors.grey[400]),
                      ),
                    ),
                  ),

                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  trailing: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      context.read<SongBloc>().add(
                            SongEvent.playOrPauseSong(song),
                          );
                    },
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, NowPlayingPage.routeName);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
