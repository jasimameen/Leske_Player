import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/utils/constants.dart';
import 'package:music_player/features/music_player/presentation/widgets/rounded_icon_button.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 100,
          width: screenWidth * .80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 62, 38, 77),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // circular progress
              const _ProgresLogo(),

              const SizedBox(width: 10),

              //  song name
              Text(
                "My Delorem",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
              const Spacer(),

              // play/pause
              const RountedIconButton(
                icon: CupertinoIcons.play_arrow_solid,
                shadowColor: Colors.transparent,
              ),
            ],
          ),
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
          height: 115,
          width: 115,
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(dummyImage),
          ),
        ),
      ],
    );
  }
}