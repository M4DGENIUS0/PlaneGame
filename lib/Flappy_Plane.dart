import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/particles.dart';
import 'package:flame/timer.dart';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_plane/Components/Plane.dart';
import 'package:flappy_plane/Components/Trailing.dart';
import 'package:flappy_plane/Components/background.dart';
import 'package:flappy_plane/Components/explosion.dart';
import 'package:flappy_plane/Components/grouped_building.dart';
import 'package:flappy_plane/game/Configs.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/painting.dart';

class Flappy_Plane extends FlameGame with TapDetector, HasCollisionDetection {
  late Airbus plane;
  late Explosion boomb;
  late TextComponent score;
  bool musicplaying = false;
  bool isHit = false;
  Timer interval = Timer(Configs.building_interval, repeat: true);

  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Trailing(),
      // group_building(),
      plane = Airbus(),
      score = BuildScore(),
      // boomb = Explosion()
    ]);
    interval.onTick = () => add(group_building());
  }

  TextComponent BuildScore() {
    return TextComponent(
        text: 'Score: 0',
        textRenderer:
            TextPaint(style: TextStyle(fontFamily: 'Crang', fontSize: 22)),
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center);
  }

  @override
  void onTap() {
    plane.fly();

    super.onTap();
  }

  @override
  void update(double dt) {
    interval.update(dt);
    score.text = 'Score: ${plane.score}';
    super.update(dt);
  }
}
