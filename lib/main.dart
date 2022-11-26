import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/utils/navigation.dart';
import 'features/music_player/presentation/bloc/song_bloc.dart';
import 'features/music_player/presentation/pages/details_page.dart';
import 'injection_container.dart';
import 'routes.dart';

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
        initialRoute: DetailsPage.routeName,

        // all the route in this app
        routes: routes,
      ),
    );
  }
}
