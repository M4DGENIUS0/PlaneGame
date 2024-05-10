import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/game/Assets.dart';
import 'package:flappy_plane/game/Configs.dart';
import 'package:flappy_plane/game/Plane_Movement.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import 'package:flutter/cupertino.dart';

class Airbus extends SpriteGroupComponent<PlaneMoment>
    with HasGameRef<Flappy_Plane>, CollisionCallbacks {
  Airbus();
  bool musicplaying = false;
  int score = 0;

  @override
  FutureOr<void> onLoad() async {
    FlameAudio.bgm.initialize();
    final plane = await gameRef.loadSprite(assets.airbus);
    final up_Plane = await gameRef.loadSprite(assets.up_airbus);
    final down_Plane = await gameRef.loadSprite(assets.down_airbus);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    size = Vector2(120, 120);
    current = PlaneMoment.middle;
    gameRef.plane;

    sprites = {
      PlaneMoment.middle: plane,
      PlaneMoment.up: up_Plane,
      PlaneMoment.down: down_Plane
    };

    add(RectangleHitbox(size: Vector2(30, 20)));
    return super.onLoad();
  }

  void fly() {
    addAll([
      MoveByEffect(
          Vector2(0, Configs.Gravity),
          EffectController(
            duration: 0.3,
            curve: Curves.easeOut,
          ), onComplete: () {
        current = PlaneMoment.down;
      }),
    ]);
    FlameAudio.play('flap.wav');
    current = PlaneMoment.up;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    print('Collision Detected');

    FlameAudio.play('gameover.mp3');

    // Timer(Duration(seconds: 5) as double, onTick: GameOver);
    GameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  void GameOver() {
    // gameRef.boomb;
    game.isHit = true;
    if (!musicplaying) {
      FlameAudio.bgm.stop();
      musicplaying = true;
    }
    // FlameAudio.play('collusion.mp3');
    game.overlays.add('gameover');
    gameRef.pauseEngine();
  }

  void ResetPosition() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  @override
  void update(double dt) {
    position.y += Configs.PlaneSpeed * dt;
    if (position.y < 1) {
      GameOver();
    }

    super.update(dt);
  }
}
