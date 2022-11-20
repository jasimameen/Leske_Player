import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/domain/entities/song.dart';


/// shows memory image if available else fetch an image from internet
  ImageProvider getImageProvider(Song? song) {
    if (song != null) return MemoryImage(song.imageData!);

    return const NetworkImage(
      'https://source.unsplash.com/random/900%C3%97700/?lofi',
    );
  }
