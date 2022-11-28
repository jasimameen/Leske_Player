import 'package:flutter/material.dart';

import 'features/music_player/presentation/pages/all_songs_page.dart';
import 'features/music_player/presentation/pages/details_page.dart';
import 'features/music_player/presentation/pages/now_playing_page.dart';
import 'features/music_player/presentation/pages/playlist_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AllSongsPage.routeName: (context) => const AllSongsPage(),
  NowPlayingPage.routeName: (context) => const NowPlayingPage(),

  // -- Current playin song details page -- 
  DetailsPage.routeName: (context) => const DetailsPage(),

  // -- Playlist page -- where all the songs in a particular playlist shows
  PlaylistPage.routeName: (context) => const PlaylistPage(),
};
