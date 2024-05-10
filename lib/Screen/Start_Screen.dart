import 'dart:ffi';

import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flappy_plane/game/Assets.dart';
import 'package:flame_audio/flame_audio.dart';

class Main_Screen extends StatelessWidget {
  final Flappy_Plane game;
  static const String id = 'menu';
  const Main_Screen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    // game.pauseEngine();
    bool musicplaying = false;

    return GestureDetector(
      onTap: () {
        game.overlays.remove('menu');
        game.resumeEngine();
        // FlameAudio.play('bg.mp3');
        FlameAudio.bgm.stop();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assets.menu), fit: BoxFit.cover)),
        // child: Image.asset(assets.menu)
      ),
    );
  }
}
