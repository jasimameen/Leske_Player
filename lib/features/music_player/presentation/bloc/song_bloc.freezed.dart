// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocalSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLocalSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocalSongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocalSongs value) getLocalSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLocalSongs value)? getLocalSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocalSongs value)? getLocalSongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongEventCopyWith<$Res> {
  factory $SongEventCopyWith(SongEvent value, $Res Function(SongEvent) then) =
      _$SongEventCopyWithImpl<$Res, SongEvent>;
}

/// @nodoc
class _$SongEventCopyWithImpl<$Res, $Val extends SongEvent>
    implements $SongEventCopyWith<$Res> {
  _$SongEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetLocalSongsCopyWith<$Res> {
  factory _$$_GetLocalSongsCopyWith(
          _$_GetLocalSongs value, $Res Function(_$_GetLocalSongs) then) =
      __$$_GetLocalSongsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetLocalSongsCopyWithImpl<$Res>
    extends _$SongEventCopyWithImpl<$Res, _$_GetLocalSongs>
    implements _$$_GetLocalSongsCopyWith<$Res> {
  __$$_GetLocalSongsCopyWithImpl(
      _$_GetLocalSongs _value, $Res Function(_$_GetLocalSongs) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetLocalSongs implements _GetLocalSongs {
  const _$_GetLocalSongs();

  @override
  String toString() {
    return 'SongEvent.getLocalSongs()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetLocalSongs);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocalSongs,
  }) {
    return getLocalSongs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLocalSongs,
  }) {
    return getLocalSongs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocalSongs,
    required TResult orElse(),
  }) {
    if (getLocalSongs != null) {
      return getLocalSongs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocalSongs value) getLocalSongs,
  }) {
    return getLocalSongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLocalSongs value)? getLocalSongs,
  }) {
    return getLocalSongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocalSongs value)? getLocalSongs,
    required TResult orElse(),
  }) {
    if (getLocalSongs != null) {
      return getLocalSongs(this);
    }
    return orElse();
  }
}

abstract class _GetLocalSongs implements SongEvent {
  const factory _GetLocalSongs() = _$_GetLocalSongs;
}

/// @nodoc
mixin _$SongState {
  List<Song> get songList => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongStateCopyWith<SongState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongStateCopyWith<$Res> {
  factory $SongStateCopyWith(SongState value, $Res Function(SongState) then) =
      _$SongStateCopyWithImpl<$Res, SongState>;
  @useResult
  $Res call(
      {List<Song> songList, bool isPlaying, bool isError, bool isLoading});
}

/// @nodoc
class _$SongStateCopyWithImpl<$Res, $Val extends SongState>
    implements $SongStateCopyWith<$Res> {
  _$SongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songList = null,
    Object? isPlaying = null,
    Object? isError = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      songList: null == songList
          ? _value.songList
          : songList // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongStateCopyWith<$Res> implements $SongStateCopyWith<$Res> {
  factory _$$_SongStateCopyWith(
          _$_SongState value, $Res Function(_$_SongState) then) =
      __$$_SongStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Song> songList, bool isPlaying, bool isError, bool isLoading});
}

/// @nodoc
class __$$_SongStateCopyWithImpl<$Res>
    extends _$SongStateCopyWithImpl<$Res, _$_SongState>
    implements _$$_SongStateCopyWith<$Res> {
  __$$_SongStateCopyWithImpl(
      _$_SongState _value, $Res Function(_$_SongState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songList = null,
    Object? isPlaying = null,
    Object? isError = null,
    Object? isLoading = null,
  }) {
    return _then(_$_SongState(
      songList: null == songList
          ? _value._songList
          : songList // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SongState implements _SongState {
  _$_SongState(
      {required final List<Song> songList,
      required this.isPlaying,
      required this.isError,
      required this.isLoading})
      : _songList = songList;

  final List<Song> _songList;
  @override
  List<Song> get songList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songList);
  }

  @override
  final bool isPlaying;
  @override
  final bool isError;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SongState(songList: $songList, isPlaying: $isPlaying, isError: $isError, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongState &&
            const DeepCollectionEquality().equals(other._songList, _songList) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_songList),
      isPlaying,
      isError,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongStateCopyWith<_$_SongState> get copyWith =>
      __$$_SongStateCopyWithImpl<_$_SongState>(this, _$identity);
}

abstract class _SongState implements SongState {
  factory _SongState(
      {required final List<Song> songList,
      required final bool isPlaying,
      required final bool isError,
      required final bool isLoading}) = _$_SongState;

  @override
  List<Song> get songList;
  @override
  bool get isPlaying;
  @override
  bool get isError;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SongStateCopyWith<_$_SongState> get copyWith =>
      throw _privateConstructorUsedError;
}
