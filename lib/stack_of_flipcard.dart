import 'package:cardflip_3d/flip_animation_card.dart';
import 'package:flutter/material.dart';


class StackOfFlipCard extends StatefulWidget {
  const StackOfFlipCard({Key key}):super(key:key);

  @override
  _StackOfFlipCardState createState() => _StackOfFlipCardState();
}

class _StackOfFlipCardState extends State<StackOfFlipCard> with SingleTickerProviderStateMixin{
  AnimationController _animationController;


  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
        vsync: this,duration: const Duration(milliseconds: 2000));
  }


  @override
  void dispose(){
    super.dispose();
    _animationController?.dispose();
  }

    bool padding=true;
    int val=0;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (dragUpdateDetails){
         if(AnimationStatus.dismissed==_animationController.status){
           _animationController.forward();
         }else{
           _animationController.reverse();
         }
      },

      behavior: HitTestBehavior.translucent,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            FlipAnimationCard(index: 0,animation: _animationController,),
            FlipAnimationCard(index: 1,animation: _animationController,),
             FlipAnimationCard(index: 2,animation: _animationController,),
            FlipAnimationCard(index: 3,animation: _animationController,),

          ],
        ),
      ),
    );
  }
}
