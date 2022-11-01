// Mocks generated by Mockito 5.3.2 from annotations
// in music_player/test/features/music_player/data/repositories/song_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:music_player/core/utils/permission_handler.dart' as _i5;
import 'package:music_player/features/music_player/data/datasources/song_local_datasource.dart'
    as _i2;
import 'package:music_player/features/music_player/data/models/song_model.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SongLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSongLocalDataSource extends _i1.Mock
    implements _i2.SongLocalDataSource {
  @override
  _i3.Future<List<_i4.SongModel>> getAllSongsFromLocalStorage() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllSongsFromLocalStorage,
          [],
        ),
        returnValue: _i3.Future<List<_i4.SongModel>>.value(<_i4.SongModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.SongModel>>.value(<_i4.SongModel>[]),
      ) as _i3.Future<List<_i4.SongModel>>);
}

/// A class which mocks [StoragePermission].
///
/// See the documentation for Mockito's code generation for more information.
class MockStoragePermission extends _i1.Mock implements _i5.StoragePermission {
  @override
  _i3.Future<bool> get isGranded => (super.noSuchMethod(
        Invocation.getter(#isGranded),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> get isDenied => (super.noSuchMethod(
        Invocation.getter(#isDenied),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> requestPermissions() => (super.noSuchMethod(
        Invocation.method(
          #requestPermissions,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
