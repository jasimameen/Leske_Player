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
            image: const DecorationImage(
              image: NetworkImage(albumArt),
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
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffE125B0),
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(0, 0),
                blurStyle: BlurStyle.outer,
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
