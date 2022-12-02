import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/utils/constants.dart';
import 'package:music_player/core/utils/navigation.dart';
import 'package:music_player/features/music_player/presentation/pages/playlist_page.dart';

import '../bloc/song_bloc.dart';
import '../widgets/rounded_icon_button.dart';
import '../widgets/seek_bar.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/details';
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // back slider
            const _MimimizeSlider(),

            // album art
            const _AlbumArt(),

            // MetaData
            BlocBuilder<SongBloc, SongState>(
              builder: (context, state) {
                final song = state.currentSong!;
                return Column(
                  children: [
                    Text(
                      song.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      song.artist,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                );
              },
            ),

            // SeekBar
            BlocBuilder<SongBloc, SongState>(
              builder: (context, state) {
                final positionStream = state.positionStream;
                return SeekBar(
                  positionStream: positionStream,
                );
              },
            ),

            // Controllers
            const _MusicControllers(),

            // BotoomBar
            const _BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _MimimizeSlider extends StatelessWidget {
  const _MimimizeSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        Navigation.pop();
      },
      child: Container(
        height: 5,
        width: 50,
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _AlbumArt extends StatelessWidget {
  const _AlbumArt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final song = context.read<SongBloc>().state.currentSong!;
    return LimitedBox(
      maxWidth: screenWidth * .8,
      maxHeight: screenWidth * .8,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            decoration: BoxDecoration(
              image: song.imageData == null
                  ? DecorationImage(
                      image: NetworkImage(dummyImage),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: MemoryImage(song.imageData!),
                      fit: BoxFit.cover,
                    ),
              shape: BoxShape.circle,
              // add gradient to image
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffE125B0),
                  Color(0xff3D1E4E),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MusicControllers extends StatelessWidget {
  const _MusicControllers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final song = context.read<SongBloc>().state.currentSong!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // shuffle
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.repeat),
        ),

        // previous
        IconButton(
          onPressed: () {
            context.read<SongBloc>().add(const SongEvent.playPreviousSong());
          },
          icon: const Icon(Icons.skip_previous),
        ),

        // play/pause
        BlocBuilder<SongBloc, SongState>(
          // only rebuilds when player state changes
          buildWhen: (previous, current) =>
              previous.isPlaying != current.isPlaying,

          builder: (context, state) {
            return RountedIconButton(
              icon: state.isPlaying
                  ? CupertinoIcons.pause_solid
                  : CupertinoIcons.play_arrow_solid,
              onTap: () {
                context.read<SongBloc>().add(SongEvent.playOrPauseSong(song));
              },
            );
          },
        ),

        // next
        IconButton(
          onPressed: () {
            context.read<SongBloc>().add(const SongEvent.playNextSong());
          },
          icon: const Icon(Icons.skip_next),
        ),

        // volume
        IconButton(
          onPressed: () {
            // do it later
          },
          icon: const Icon(Icons.volume_up),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screeenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: screeenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // download icon
          IconButton(
            icon: const Icon(CupertinoIcons.cloud_download),
            onPressed: () {},
          ),

          // playlist icon
          IconButton(
            icon: const Icon(CupertinoIcons.list_bullet),
            onPressed: () {
              // show playlist
              Navigation.pushNamed(PlaylistPage.routeName);
            },
          ),

          // favorate icon
          IconButton(
            icon: const Icon(CupertinoIcons.heart_fill),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
