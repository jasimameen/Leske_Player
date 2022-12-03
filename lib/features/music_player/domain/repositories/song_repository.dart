import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/song.dart';

abstract class SongRepository {
  Future<Either<Failure, List<Song>>> getSongsFromLocalStorage();
}

