import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/presentation/widgets/rounded_icon_button.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        // cover Icon
        leading: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: const Color.fromARGB(124, 117, 96, 123),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            CupertinoIcons.music_note_2,
            size: 22,
            color: Colors.white54,
          ),
        ),

        // Song Name
        title: const Text(
          'Low Earth Orbit',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Subtitle of the song
        subtitle: Text('A Synthwave Mix'),

        // favorate Icons
        trailing: Icon(
          CupertinoIcons.heart_fill,
          color: Color.fromARGB(139, 135, 122, 124),
          size: 30,
        ),
      ),
    );
  }
}
