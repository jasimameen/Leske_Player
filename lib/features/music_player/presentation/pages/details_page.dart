import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// random unsplash image url
const albumArt = 'https://source.unsplash.com/random/900%C3%97700/?lofi';

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
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // album art
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  albumArt,
                  fit: BoxFit.cover,
                ),
              ),
            ),

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
            Container(
              height: 5,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

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
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),

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
            icon: const Icon(Icons.playlist_play_rounded),
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
