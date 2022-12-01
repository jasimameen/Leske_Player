// random Image from unsplash
import 'dart:math';

List randomList = ['cyberpunk', 'lofi', 'dark'];

String get dummyImage =>
    // ignore: prefer_interpolation_to_compose_strings
    "https://source.unsplash.com/random/900%C3%97700/?" +
    randomList[Random().nextInt(randomList.length)];
