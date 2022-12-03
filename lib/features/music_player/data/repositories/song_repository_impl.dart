import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/permission_handler.dart';
import '../datasources/song_local_datasource.dart';
import '../../domain/entities/song.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/song_repository.dart';

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
