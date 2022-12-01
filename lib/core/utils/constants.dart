// random Image from unsplash
import 'dart:math';

import 'package:flutter/material.dart';

List randomList = ['lofi'];

String get dummyImage =>
    // ignore: prefer_interpolation_to_compose_strings
    "https://source.unsplash.com/random/900%C3%97700/?" +
    randomList[Random().nextInt(randomList.length)];

// random color
Color get randomColor =>
    Colors.primaries[Random().nextInt(Colors.primaries.length)];
