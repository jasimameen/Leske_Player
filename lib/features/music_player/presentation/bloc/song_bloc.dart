import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/utils/navigation.dart';

import 'package:music_player/features/music_player/domain/entities/song.dart';
import 'package:music_player/features/music_player/domain/repositories/song_repository.dart';
import 'package:music_player/features/music_player/presentation/pages/details_page.dart';
import 'package:rxdart/rxdart.dart';

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
    // updates the postion, buffer and duration in the state
    SongState updatePositionStream() {
      // combine
      final stream = Rx.combineLatest3(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (position, buffer, duration) =>
            PositionStreamData(position, buffer, duration),
      );
      return state.copyWith(positionStream: stream);
    }

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
        add(SongEvent.playOrPauseSong(event.song));
        Navigation.pushNamed(DetailsPage.routeName);
      },
    );

    on<_PlayOrPauseSong>(
      (event, emit) async {
        if (state.currentSong != event.song) {
          audioPlayer.setUrl(event.song.path);
          audioPlayer.play();

          updatePositionStream();
          final bool plySta = audioPlayer.playing;
          emit(state.copyWith(
            isPlaying: plySta,
            currentSong: event.song,
          ));
          return;
        }

        emit(updatePositionStream());

        // play and pause audio
        state.isPlaying ? audioPlayer.pause() : audioPlayer.play();
        emit(state.copyWith(
          isPlaying: audioPlayer.playing,
          currentSong: event.song,
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

        updatePositionStream();

        emit(
          state.copyWith(
            isPlaying: audioPlayer.playing,
            currentSong: nextSong,
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

      updatePositionStream();

      emit(state.copyWith(
        isPlaying: audioPlayer.playing,
        currentSong: previousSong,
      ));
    });

    on<_SeekTo>((event, emit) {
      audioPlayer.seek(event.duration);
      emit(updatePositionStream());
      audioPlayer.play();
    });
  }
}
