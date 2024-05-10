import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_plane/Components/Plane.dart';
import 'package:flappy_plane/Components/Plane.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Components/Plane.dart';

class Game_Over extends StatelessWidget {
  final Flappy_Plane game;
  static const String id = 'gameover';
  const Game_Over({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: InkWell(
        onTap: reStart,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Game Over',
                style: TextStyle(fontFamily: 'Crang', color: Colors.red),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Total Score: ${game.plane.score}',
                style: TextStyle(
                    fontFamily: 'Crang', fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Flap the Plane!',
                style: TextStyle(fontFamily: 'Crang', color: Colors.white),
              ),
              SizedBox(height: 42),
              Text(
                "Made in Flutter with 💙",
                style: TextStyle(
                    fontFamily: 'Crang', fontSize: 9, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  void reStart() {
    game.plane.ResetPosition();
    FlameAudio.bgm.pause();
    game.overlays.remove('gameover');
    // FlameAudio.play('bg.mp3');
    FlameAudio.audioCache.clear('gameover.mp3');
    game.resumeEngine();
  }
}
