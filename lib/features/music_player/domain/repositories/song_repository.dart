import 'package:dartz/dartz.dart';

import 'package:music_player/core/error/failure.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';

abstract class SongRepository {
  Future<Either<Failure, List<Song>>> getSongsFromLocalStorage();
}

