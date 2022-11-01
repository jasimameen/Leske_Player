import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/utils/permission_handler.dart';
import 'package:music_player/features/music_player/data/datasources/song_local_datasource.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongLocalDataSource localDataSource;
  final StoragePermission permission;

  SongRepositoryImpl(this.localDataSource, this.permission);

  @override
  Future<Either<Failure, List<Song>>> getSongsFromLocalStorage() async {
    if (await permission.isGranded) {
      try {
        final localSongs = await localDataSource.getAllSongsFromLocalStorage();
        return Right(localSongs);
      } on LocalDataException {
        return Left(ClientFailure());
      }
    }
    if (await permission.isDenied) {
      return Left(PermissionDeniedFailure());
    }
    final granded = await permission.requestPermissions();
    if (granded) {
      try {
        final localSongs = await localDataSource.getAllSongsFromLocalStorage();
        return Right(localSongs);
      } catch (e) {
        return Left(ClientFailure());
      }
    }

    return Left(ClientFailure());
  }
}
