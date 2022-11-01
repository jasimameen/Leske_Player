import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music_player/presentation/pages/all_songs.dart';

import 'features/music_player/presentation/bloc/song_bloc.dart';
import 'injection_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SongBloc>(),
      child: MaterialApp(
        title: 'Music Player',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Music Player'),
          ),
          body: const AllSongsPage(),
        ),
      ),
    );
  }
}
