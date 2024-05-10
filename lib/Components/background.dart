import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_plane/Flappy_Plane.dart';
import 'package:flappy_plane/game/Assets.dart';

class Background extends SpriteComponent with HasGameRef<Flappy_Plane> {
  Background();

  @override
  FutureOr<void> onLoad() async {
    final bg = await Flame.images.load(assets.bg);
    size = gameRef.size;
    sprite = Sprite(bg);
    return super.onLoad();
  }
}
