import 'package:flutter/material.dart';
import '../../features/music_player/domain/entities/song.dart';

/// shows memory image if available else fetch an image from internet
ImageProvider<Object> getImageProvider(Song song) {
  if (song.imageData != null) {
    return MemoryImage(song.imageData!);
  }

  return const NetworkImage(
    'https://source.unsplash.com/random/900%C3%97700/?lofi',
  );
}
