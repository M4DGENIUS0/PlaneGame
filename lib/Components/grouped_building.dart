import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_plane/Components/Building.dart';
import 'package:flappy_plane/Components/Plane.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/game/Building_Postion.dart';
import 'package:flappy_plane/game/Configs.dart';

class group_building extends PositionComponent with HasGameRef<Flappy_Plane> {
  group_building();
  final _random = Random();

  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    final Height_Minus_Ground = gameRef.size.y - Configs.Ground_Height;
    final spaceing = 100 + _random.nextDouble() * (Height_Minus_Ground / 2);
    final CentreY =
        spaceing + _random.nextDouble() * (Height_Minus_Ground - spaceing);
    addAll([
      Building(
          height: CentreY - spaceing / 2, buildings_position: Buildings.up),
      Building(
          height: Height_Minus_Ground - (CentreY + spaceing / 2),
          buildings_position: Buildings.down)
    ]);
    // add(RectangleHitbox());
    return super.onLoad();
  }

  void updateScore() {
    gameRef.plane.score += 1;
  }

  @override
  void update(double dt) {
    position.x -= Configs.gameSpeed * dt;
    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
    super.update(dt);
  }
}
