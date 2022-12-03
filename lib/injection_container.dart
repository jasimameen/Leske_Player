import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'core/utils/permission_handler.dart';
import 'features/music_player/data/datasources/song_local_datasource.dart';
import 'features/music_player/data/repositories/song_repository_impl.dart';
import 'features/music_player/domain/repositories/song_repository.dart';
import 'features/music_player/domain/usecases/get_all_songs.dart';
import 'features/music_player/presentation/bloc/song_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Fetures - Song
  // Bloc
  sl.registerFactory(() => SongBloc(sl(), sl()));

// usecases
  sl.registerLazySingleton(() => GetSongsFromLocalStorage(sl()));

// Repository
  sl.registerLazySingleton<SongRepository>(
      () => SongRepositoryImpl(sl(), sl()));

// DataSources
  sl.registerLazySingleton<SongLocalDataSource>(
      () => SongLocalDataSourceImpl(sl()));

  //! External
  sl.registerLazySingleton(() => OnAudioQuery());
  sl.registerLazySingleton(() => StoragePermission());
  sl.registerLazySingleton(() => AudioPlayer());
}
