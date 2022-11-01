import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failure.dart';
import 'package:music_player/core/usecases/usecases.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';

class GetSongsFromLocalStorage extends UseCases<List<Song>, NoParams> {
  SongRepository repository;

  GetSongsFromLocalStorage(this.repository);

  @override
  Future<Either<Failure, List<Song>>> call(NoParams params) {
    return repository.getSongsFromLocalStorage();
  }
}
