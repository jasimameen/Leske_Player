import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/utils/permission_handler.dart';
import 'package:music_player/features/music_player/data/datasources/song_local_datasource.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'song_local_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<StoragePermission>(), MockSpec<OnAudioQuery>()])
void main() {
  late SongLocalDataSourceImpl datasource;
  late MockOnAudioQuery mockOnAudioQuery;

  setUp(() {
    mockOnAudioQuery = MockOnAudioQuery();
    datasource = SongLocalDataSourceImpl(mockOnAudioQuery);
  });

  group('getAllSongsFromLocalStorage', () {
    test(
      "should return list of SongModel when call to local data source is succesfull",
      () async {
        // arrange
        when(mockOnAudioQuery.querySongs()).thenAnswer((_) async => []);
        // act
        final result = await datasource.getAllSongsFromLocalStorage();
        // assert
        expect(result, []);
      },
    );

    test(
      "should throw LocalDataException when call to local data source is unsuccesfull",
      () async {
        // arrange
        when(mockOnAudioQuery.querySongs()).thenThrow(Exception());
        // act
        final call = datasource.getAllSongsFromLocalStorage;
        // assert
        expect(() => call(), throwsA(isA<LocalDataException>()));
      },
    );
  });
}
