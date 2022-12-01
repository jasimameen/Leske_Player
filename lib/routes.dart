import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/presentation/pages/home_page.dart';

import 'features/music_player/presentation/pages/details_page.dart';
import 'features/music_player/presentation/pages/playlist_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // -- Home page --
  HomePage.routeName : (context) => const HomePage(),
  // -- Current playin song details page --
  DetailsPage.routeName: (context) => const DetailsPage(),

  // -- Playlist page -- where all the songs in a particular playlist shows
  PlaylistPage.routeName: (context) => const PlaylistPage(),
};
