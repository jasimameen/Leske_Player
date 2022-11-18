import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/utils/navigation.dart';

import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';
import 'package:music_player/features/music_player/presentation/pages/now_playing_page.dart';

part 'song_bloc.freezed.dart';
part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository songRepository;
  final AudioPlayer audioPlayer;

  SongBloc(
    this.songRepository,
    this.audioPlayer,
  ) : super(SongState.initial()) {
    on<_GetLocalSongs>(
      (event, emit) async {
        // send loading state
        emit(state.copyWith(isLoading: true));

        // get songs
        final songs = await songRepository.getSongsFromLocalStorage();

        emit(
          songs.fold(
            (failure) => state.copyWith(
              songList: [],
              isPlaying: false,
              isError: true,
              isLoading: false,
            ),
            (songs) => state.copyWith(
              songList: songs,
              isPlaying: false,
              isError: false,
              isLoading: false,
            ),
          ),
        );
      },
    );

    on<_ShowSongDetails>(
      (event, emit) async {
        if (event.song != state.currentSong) {
          Navigation.pushNamed(
            NowPlayingPage.routeName,
            arguments: event.song,
          );
        } else {
          Navigation.pushNamed(NowPlayingPage.routeName);
        }
      },
    );

    on<_PlayOrPauseSong>(
      (event, emit) async {
        if (state.currentSong != event.song) {
          audioPlayer.setUrl(event.song.path);
        }

        // play and pause audio
        state.isPlaying ? audioPlayer.pause() : audioPlayer.play();
        emit(state.copyWith(
          isPlaying: !state.isPlaying,
          currentSong: event.song,
          positionStream: audioPlayer.positionStream,
        ));
      },
    );

    on<_PlayNextSong>(
      (event, emit) async {
        final currentSongIndex = state.songList.indexOf(state.currentSong!);

        final nextSong = currentSongIndex != state.songList.length - 1
            ? state.songList[currentSongIndex + 1]
            : state.songList.first;

        audioPlayer.setUrl(nextSong.path);
        audioPlayer.play();

        emit(
          state.copyWith(
            isPlaying: true,
            currentSong: nextSong,
            positionStream: audioPlayer.positionStream,
          ),
        );
      },
    );

    on<_PlayPreviousSong>((event, emit) {
      final currentSongIndex = state.songList.indexOf(state.currentSong!);

      final previousSong = currentSongIndex != 0
          ? state.songList[currentSongIndex - 1]
          : state.songList.last;

      audioPlayer.setUrl(previousSong.path);
      audioPlayer.play();

      emit(state.copyWith(
        isPlaying: true,
        currentSong: previousSong,
        positionStream: audioPlayer.positionStream,
      ));
    });

    on<_SeekTo>((event, emit) {
      audioPlayer.seek(event.duration);
      emit(state.copyWith(positionStream: Stream.value(event.duration)));
    });
  }
}
