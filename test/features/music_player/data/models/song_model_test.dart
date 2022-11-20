import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/features/music_player/data/models/song_model.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tSongModel = SongModel(
    id: 1,
    title: "test title",
    artist: "test artist",
    path: "test path",
    isMusic: true,
    duration: 0,
  );

  test(
    "should be a subclass of Song entity",
    () {
      expect(tSongModel, isA<Song>());
    },
  );

  group('fromMap', () {
    test(
      "should return a valid model when the given Map duration is a number",
      () {
        // arrange
        final Map<String, dynamic> map = json.decode(fixture('song.json'));

        // act
        final result = SongModel.fromMap(map);

        // assert
        expect(result, tSongModel);
      },
    );

    test(
        'should return valid model with duration 0 when given Map duration is null',
        () {
      // arrange
      final Map<String, dynamic> map =
          json.decode(fixture('song_empty_duration.json'));

      // act
      final result = SongModel.fromMap(map);

      // assert
      expect(result, tSongModel);
    });
  });
}
