import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/game/Assets.dart';

class Explosion extends FlameGame {
  late SpriteComponent ExplosionComponent;
  late SpriteAnimationComponent Bomb;
  double ScaleFactor = 3.0;
  @override
  Future<void> onLoad() async {
    Image explosion = await images.load(assets.explosion);
    var ExplosionComponent = SpriteAnimation.fromFrameData(
        explosion,
        SpriteAnimationData.sequenced(
            amount: 10, stepTime: 0.1, textureSize: Vector2(32, 34)));
    Bomb = SpriteAnimationComponent()
      ..animation = ExplosionComponent
      ..size = Vector2(32, 34) * ScaleFactor;
    add(Bomb);
    return super.onLoad();
  }
}
