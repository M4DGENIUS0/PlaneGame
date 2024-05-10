import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/game/Assets.dart';
import 'package:flappy_plane/game/Building_Postion.dart';
import 'package:flappy_plane/game/Configs.dart';

class Building extends SpriteComponent
    with HasGameRef<Flappy_Plane>, CollisionCallbacks {
  final double height;
  final Buildings buildings_position;
  Building({required this.height, required this.buildings_position});
  @override
  FutureOr<void> onLoad() async {
    final straight_buiding = await Flame.images.load(assets.building);
    final upside_down = await Flame.images.load(assets.Upside_Down_Building);
    size = Vector2(50, height);

    switch (buildings_position) {
      case Buildings.up:
        position.y = 0;
        sprite = Sprite(upside_down);
        break;
      case Buildings.down:
        position.y = gameRef.size.y - size.y - Configs.Ground_Height;
        sprite = Sprite(straight_buiding);
        break;
    }
    // add(RectangleHitbox(
    //     position: Vector2(0, gameRef.size.y - 165.0),
    //     size: Vector2(gameRef.size.x, 165.0)));
    add(RectangleHitbox());
    return super.onLoad();
  }
}
