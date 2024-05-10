import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/Screen/Game_Over.dart';
import 'package:flappy_plane/Screen/Start_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = Flappy_Plane();
  // FlameAudio.bgm.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(GameWidget(
    game: game,
    // initialActiveOverlays: ['menu'],
    overlayBuilderMap: {
      'menu': (BuildContext context, Flappy_Plane game) {
        return Main_Screen(
          game: game,
        );
      },
      'gameover': (context, _) => Game_Over(
            game: game,
          )
    },
  ));
}
