import 'dart:math';
import 'package:cardflip_3d/card_details_screen.dart';
import 'package:cardflip_3d/util.dart';
import 'package:flutter/material.dart';
import 'flip_card.dart';

class FlipAnimationCard extends AnimatedWidget {
  final int index;
  final Animation<double> animation;

  const FlipAnimationCard(
      {Key key, @required this.index, @required this.animation})
      : assert(index != null),
        assert(animation != null),
        super(listenable: animation, key: key);

  double getYTranslation() {
    return index * 30.0 + index * animation.value * 40;
  }

  double getRotation() {
    return pi * animation.value / 3;
  }

  double getPadding() {
    return animation.value * 5 * index;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return CardDetailScreen(index: index,);
                },
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }));
      },
      behavior: HitTestBehavior.deferToChild,
      child: Hero(
        tag: Util.cards[index].heroTag,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPadding()),
          child: FlipCard(
            index: index,
            transform: Matrix4.identity()
              ..setEntry(2, 1, 0.002)
              ..translate(0.0, getYTranslation(), 0.0)
              ..rotateX(getRotation()),
          ),
        ),
      ),
    );
  }
}
