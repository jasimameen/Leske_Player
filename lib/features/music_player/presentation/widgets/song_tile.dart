import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music_player/core/utils/navigation.dart';
import 'package:music_player/features/music_player/presentation/pages/details_page.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigation.pushNamed(DetailsPage.routeName);
        },
        // cover Icon
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(124, 117, 96, 123),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            CupertinoIcons.music_note_2,
            size: 21,
            color: Colors.white54,
          ),
        ),

        // Song Name
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Subtitle of the song
        subtitle: Text(subtitle),

        // favorate Icons
        trailing: const Icon(
          CupertinoIcons.heart_fill,
          color: Color.fromARGB(139, 135, 122, 124),
          size: 30,
        ),
      ),
    );
  }
}
