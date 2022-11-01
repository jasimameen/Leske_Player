import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/song_bloc.dart';

class AllSongsPage extends StatelessWidget {
  const AllSongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SongBloc>(context).add(const SongEvent.getLocalSongs());
    });


    return Padding(
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
            itemBuilder: (context, index) {
              final song = state.songList[index];
              return ListTile(
                title: Text(song.title),
                subtitle: Text(song.artist),
                trailing: IconButton(
                  icon: Icon(
                    state.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () {
                    context.read<SongBloc>().add(
                          SongEvent.playOrPauseSong(song),
                        );
                  },
                ),
              );
            },
          );

        },
      ),
    );
  }
}
