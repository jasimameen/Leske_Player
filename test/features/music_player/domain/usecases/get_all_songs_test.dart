import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/usecases/usecases.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';
import 'package:music_player/features/music_player/domain/usecases/get_all_songs.dart';

import 'get_all_songs_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SongRepository>()])
void main() {
  late GetSongsFromLocalStorage usecase;
  late MockSongRepository mockSongRepository;

  setUp(() {
    mockSongRepository = MockSongRepository();
    usecase = GetSongsFromLocalStorage(mockSongRepository);
  });

  // testObjects
  const tSongs = [
    Song(
      id: 1,
      title: "test title",
      artist: "test artist",
      path: "test path",
      isMusic: true,
      duration: 1,
    ),
  ];

  group('getSongsFromLocalStorage', () {
    test(
      'should get song Entity from the repository ',
      () async {
        // arrange
        when(mockSongRepository.getSongsFromLocalStorage())
            .thenAnswer((realInvocation) async => const Right(tSongs));

        // act
        final result = await usecase(NoParams());

        // assert
        expect(result, const Right(tSongs));
        verify(mockSongRepository.getSongsFromLocalStorage());
        verifyNoMoreInteractions(mockSongRepository);
      },
    );
  });
}
