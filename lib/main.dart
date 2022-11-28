import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music_player/presentation/pages/playlist_page.dart';

import 'core/utils/navigation.dart';
import 'features/music_player/presentation/bloc/song_bloc.dart';
import 'injection_container.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await init();
  // await Permission.storage.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SongBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // navigation state
        navigatorKey: Navigation.initState(),
        title: 'Music Player',

        // -- theme --
        themeMode: ThemeMode.dark,
        // dark theme
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: const Color(0xff3D1E4E),
          primaryColor: const Color(0xffE125B0),
          iconTheme: const IconThemeData(color: Colors.white),

          // text theme
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline4: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                headline6: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
                subtitle1: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Color(0xff877A7C),
                ),
                caption: const TextStyle(color: Color(0xff877A7C)),
              ),
        ),

        // all the route in this app
        initialRoute: PlaylistPage.routeName,
        routes: routes,
      ),
    );
  }
}
