import 'package:flutter/material.dart';

import 'features/music_player/presentation/pages/all_songs_page.dart';
import 'features/music_player/presentation/pages/details_page.dart';
import 'features/music_player/presentation/pages/now_playing_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AllSongsPage.routeName: (context) => const AllSongsPage(),
  NowPlayingPage.routeName: (context) => const NowPlayingPage(),
  DetailsPage.routeName: (context) => const DetailsPage(),
};
