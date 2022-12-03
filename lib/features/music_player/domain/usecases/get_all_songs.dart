import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/song.dart';
import '../repositories/song_repository.dart';

class GetSongsFromLocalStorage extends UseCases<List<Song>, NoParams> {
  SongRepository repository;

  GetSongsFromLocalStorage(this.repository);

  @override
  Future<Either<Failure, List<Song>>> call(NoParams params) {
    return repository.getSongsFromLocalStorage();
  }
}
