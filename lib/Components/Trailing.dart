import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/game/Assets.dart';
import 'package:flappy_plane/game/Configs.dart';

class Trailing extends ParallaxComponent<Flappy_Plane>
    with HasGameRef<Flappy_Plane> {
  @override
  FutureOr<void> onLoad() async {
    final trailing = await Flame.images.load(assets.traiing);
    parallax = Parallax(
        [ParallaxLayer(ParallaxImage(trailing, fill: LayerFill.none))]);
    add(RectangleHitbox(
        position: Vector2(0, gameRef.size.y - 230),
        size: Vector2(gameRef.size.x, 230)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = Configs.gameSpeed;
    super.update(dt);
  }
}
