import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/utils/navigation.dart';
import 'package:music_player/features/music_player/presentation/pages/all_songs_page.dart';
import 'package:music_player/features/music_player/presentation/pages/now_playing_page.dart';
import 'package:permission_handler/permission_handler.dart';

import 'features/music_player/presentation/bloc/song_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Permission.storage.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SongBloc>(),
      child: MaterialApp(
        navigatorKey: Navigation.initState(),
        title: 'Music Player',
        home: const AllSongsPage(),
        routes: {
          AllSongsPage.routeName: (context) => const AllSongsPage(),
          NowPlayingPage.routeName: (context) => const NowPlayingPage(),
        },
      ),
    );
  }
}
