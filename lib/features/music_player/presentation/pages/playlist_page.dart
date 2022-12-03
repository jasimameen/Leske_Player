import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants.dart';
import '../bloc/song_bloc.dart';
import '../widgets/rounded_icon_button.dart';
import '../widgets/song_tile.dart';

class PlaylistPage extends StatelessWidget {
  static const routeName = '/playlist';
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // -- Title of the playlist --
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  // bg image
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SizedBox.expand(
                      child: Image.network(
                        dummyImage,
                        errorBuilder: (context, err, _) =>
                            Container(color: Colors.black38),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Contents
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        // Navigation bar
                        _NavBar(),

                        // Metadata of the playlist
                        _PlaylistMetaData(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // -- List of songs in the playlist --
            Expanded(
              flex: 3,
              child:
                  BlocBuilder<SongBloc, SongState>(builder: (context, state) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = state.songList[index];
                    return GestureDetector(
                      onTap: () {
                        // go to song page
                        context
                            .read<SongBloc>()
                            .add(SongEvent.showSongDetails(data),);
                      },
                      child: SongTile(
                        title: data.title,
                        subtitle: data.artist,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemCount: state.songList.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaylistMetaData extends StatelessWidget {
  const _PlaylistMetaData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: const [
          // metaData
          _TitleAndSongCount(),

          Spacer(),

          // play button
          RountedIconButton(
            icon: CupertinoIcons.play_arrow_solid,
            shadowColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.arrow_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(CupertinoIcons.ellipsis_vertical),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _TitleAndSongCount extends StatelessWidget {
  const _TitleAndSongCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Jazz',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 8),

        // Subtitle song count and hours
        Text(
          '100 songs  18 hours',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
