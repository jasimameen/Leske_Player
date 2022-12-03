import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/error/failure.dart';
import 'package:music_player/core/utils/permission_handler.dart';
import 'package:music_player/features/music_player/data/datasources/song_local_datasource.dart';
import 'package:music_player/features/music_player/data/models/song_model.dart';
import 'package:music_player/features/music_player/data/repositories/song_repository_impl.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';

import 'song_repository_impl_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<SongLocalDataSource>(), MockSpec<StoragePermission>()])
void main() {
  late SongRepositoryImpl repository;
  late MockStoragePermission mockStoragePermission;
  late MockSongLocalDataSource mockSongLocalDataSource;

  setUp(() {
    mockSongLocalDataSource = MockSongLocalDataSource();
    mockStoragePermission = MockStoragePermission();
    repository =
        SongRepositoryImpl(mockSongLocalDataSource, mockStoragePermission);
  });

  final tSongModels = [
    SongModel(
      id: 1,
      title: "test title",
      artist: "test artist",
      path: "test path",
      isMusic: true,
      duration: 1,
    ),
  ];
  final List<Song> tSongs = tSongModels;

  test(
    "should check storage permission status",
    () async {
      // act
      repository.getSongsFromLocalStorage();

      // assert
      verify(mockStoragePermission.isGranded);
    },
  );

  group('permission granded', () {
    setUp(() {
      when(mockStoragePermission.isGranded).thenAnswer((_) async => true);
    });

    group('getSongsFromLocalStorage', () {
      test(
        "should return list of Song when call to local data source is succesfull",
        () async {
          // arrange
          when(mockSongLocalDataSource.getAllSongsFromLocalStorage())
              .thenAnswer((realInvocation) async => tSongModels);
          // act
          final result = await repository.getSongsFromLocalStorage();
          // assert
          verify(mockSongLocalDataSource.getAllSongsFromLocalStorage());
          expect(result, equals(Right(tSongs)));
        },
      );

      test(
        "should return client failure when call to local datasource is unsuccessful",
        () async {
          // arrange
          when(mockSongLocalDataSource.getAllSongsFromLocalStorage())
              .thenThrow(LocalDataException());

          // act
          final result = await repository.getSongsFromLocalStorage();

          // assert
          verify(mockSongLocalDataSource.getAllSongsFromLocalStorage());
          expect(result, equals(Left(ClientFailure())));
        },
      );
    });
  });

  group('permission denied', () {
    setUp(() {
      when(mockStoragePermission.isGranded).thenAnswer((_) async => false);
      when(mockStoragePermission.isDenied).thenAnswer((_) async => true);
    });

    group('getSongsFromLocalStorage', () {
      test(
        "should return permission denied failure when storage permission is denied",
        () async {
          // act
          final result = await repository.getSongsFromLocalStorage();

          // assert
          expect(result, equals(Left(PermissionDeniedFailure())));
          verifyNever(mockSongLocalDataSource.getAllSongsFromLocalStorage());
        },
      );
    });
  });

  group('permission required', () {
    setUp(() {
      when(mockStoragePermission.isGranded).thenAnswer((_) async => false);
      when(mockStoragePermission.isDenied).thenAnswer((_) async => false);
    });

    group('getSongsFromLocalStorage', () {
      test(
        "should request storage permission when storage permission is required",
        () async {
          // act
          await repository.getSongsFromLocalStorage();

          // assert
          verify(mockStoragePermission.requestPermissions());
        },
      );

      test(
        "should return client failure when storage permission is required and request is unsuccessful",
        () async {
          // arrange
          when(mockStoragePermission.requestPermissions())
              .thenAnswer((_) async => false);

          // act
          final result = await repository.getSongsFromLocalStorage();

          // assert
          expect(result, equals(Left(ClientFailure())));
          verifyNever(mockSongLocalDataSource.getAllSongsFromLocalStorage());
        },
      );

      test(
        "should return list of Song when storage permission is required and request is successful",
        () async {
          // arrange
          when(mockStoragePermission.requestPermissions())
              .thenAnswer((_) async => true);
          when(mockSongLocalDataSource.getAllSongsFromLocalStorage())
              .thenAnswer((realInvocation) async => tSongModels);

          // act
          final result = await repository.getSongsFromLocalStorage();

          // assert
          expect(result, equals( Right(tSongs)));
          verify(mockSongLocalDataSource.getAllSongsFromLocalStorage());
        },
      );
    });
  });

}
