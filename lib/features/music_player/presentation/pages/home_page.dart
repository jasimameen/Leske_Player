import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/presentation/widgets/home_playlist_tile.dart';
import 'package:music_player/features/music_player/presentation/widgets/search_bar_widget.dart';
import 'package:music_player/features/music_player/presentation/widgets/song_tile.dart';

import '../widgets/mini_player.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // search widget
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    "Library",
                    style: Theme.of(context).textTheme.headline3,
                  ),

                  const SizedBox(height: 20),

                  // search bar
                  const SearchBarWidget(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // playlist list horizontal
           const Flexible(
              flex: 1,
              child: _PlaylistSection(),
            ),

            const SizedBox(height: 20),

            // favorates list
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Favorite",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // favorate items
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const SongTile(),
              ),
            ),
          ],
        ),
      ),

      // now playing song mini widget
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const MiniPlayer(),
    );
  }
}

class _PlaylistSection extends StatelessWidget {
  const _PlaylistSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Playlists",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),

        const SizedBox(height: 20),

        // list
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => const HomePlayListTile(),
          ),
        ),
      ],
    );
  }
}
