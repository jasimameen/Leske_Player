import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/utils/constants.dart';
import 'package:music_player/core/utils/navigation.dart';

import '../widgets/rounded_icon_button.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/details';
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // back slider
            const _MimimizeSlider(),

            // album art
            const _AlbumArt(),

            // MetaData
            Column(
              children: [
                Text(
                  'My Delorean',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'A Synthwave Mixtape',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),

            // SeekBar
            const _SeekBar(),

            // Controllers
            const _MusicControllers(),

            // BotoomBar
            const _BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _MimimizeSlider extends StatelessWidget {
  const _MimimizeSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        Navigation.pop();
      },
      child: Container(
        height: 5,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _AlbumArt extends StatelessWidget {
  const _AlbumArt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(dummyImage),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            // add gradient to image
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffE125B0),
                Color(0xff3D1E4E),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SeekBar extends StatelessWidget {
  const _SeekBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double seekValue = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // seekbar
          Slider(
            value: seekValue,
            onChanged: (value) {
              // update seekbar
            },
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey.withOpacity(0.2),
          ),

          // time stamps
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // start time
                Text(
                  '0:00',
                  style: Theme.of(context).textTheme.caption,
                ),

                // end time
                Text(
                  '3:00',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MusicControllers extends StatelessWidget {
  const _MusicControllers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // shuffle
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.repeat),
        ),

        // previous
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.skip_previous),
        ),

        // play/pause
        const RountedIconButton(icon: CupertinoIcons.play_arrow_solid),

        // next
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.skip_next),
        ),

        // volume
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.volume_up),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screeenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: screeenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // download icon
          IconButton(
            icon: const Icon(CupertinoIcons.cloud_download),
            onPressed: () {},
          ),

          // playlist icon
          IconButton(
            icon: const Icon(CupertinoIcons.list_bullet),
            onPressed: () {},
          ),

          // favorate icon
          IconButton(
            icon: const Icon(CupertinoIcons.heart_fill),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
