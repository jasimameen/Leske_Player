import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/utils/constants.dart';
import 'package:music_player/core/utils/navigation.dart';
import 'package:music_player/features/music_player/presentation/pages/details_page.dart';
import 'package:music_player/features/music_player/presentation/widgets/rounded_icon_button.dart';
import 'package:music_player/features/music_player/presentation/widgets/song_tile.dart';

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
                        loadingBuilder: (context, err, _) =>
                            const LinearProgressIndicator(),
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
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigation.pushNamed(DetailsPage.routeName);
                    },
                    child: const SongTile()),
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: 6,
              ),
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
          'Playlist Name',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 8),

        // Subtitle song count and hours
        Text(
          '100 songs  10 hours',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
