// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';

import '../../../../core/error/failure.dart';

part 'song_bloc.freezed.dart';
part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository songRepository;
  SongBloc(
    this.songRepository,
  ) : super(SongState.initial()) {
    on<_GetLocalSongs>(
      (event, emit) async {
        // send loading state
        emit(SongState(
          songList: [],
          isPlaying: false,
          isError: false,
          isLoading: true,
        ));

        // get songs
        final songs = await songRepository.getSongsFromLocalStorage();

        emit(
          songs.fold(
            (failure) => SongState(
              songList: [],
              isPlaying: false,
              isError: true,
              isLoading: false,
            ),
            (songs) => SongState(
              songList: songs,
              isPlaying: false,
              isError: false,
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
