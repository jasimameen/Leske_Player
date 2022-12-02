import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:music_player/core/utils/constants.dart';
import 'package:music_player/core/utils/navigation.dart';
import 'package:music_player/features/music_player/presentation/bloc/song_bloc.dart';
import 'package:music_player/features/music_player/presentation/pages/details_page.dart';
import 'package:music_player/features/music_player/presentation/widgets/rounded_icon_button.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigation.pushNamed(DetailsPage.routeName);
          },
          child: Container(
            height: 75,
            width: screenWidth * .80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 38, 77),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 70),
          child: BlocBuilder<SongBloc, SongState>(builder: (context, state) {
            final song = state.currentSong!;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // circular progress
                const _ProgresLogo(),

                const SizedBox(width: 10),

                //  song name
                Text(
                  song.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),

                // play/pause
                RountedIconButton(
                  icon: state.isPlaying
                      ? CupertinoIcons.pause_solid
                      : CupertinoIcons.play_arrow_solid,
                  shadowColor: Colors.transparent,
                  onTap: () {
                    context
                        .read<SongBloc>()
                        .add(SongEvent.playOrPauseSong(song));
                  },
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class _ProgresLogo extends StatelessWidget {
  const _ProgresLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(dummyImage),
          ),
        ),
      ],
    );
  }
}
