import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';


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

    on<_PlayOrPauseSong>(
      (event, emit) async {
        // send loading state
        emit(SongState(
          songList: state.songList,
          isPlaying: !state.isPlaying,
          isError: false,
          isLoading: false,
        ));
      },
    );
  }
}
