import 'package:cardflip_3d/flip_animation_card.dart';
import 'package:cardflip_3d/flip_card.dart';
import 'package:cardflip_3d/stack_of_flipcard.dart';
import 'package:cardflip_3d/util.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 50.0),
          children: <Widget>[
             const Header(),
             const  SizedBox(height: 30.0,),
             const StackOfFlipCard(),
             const  SizedBox(height: 120.0,),
             const Divider(color: Colors.black54,),
             const  SizedBox(height: 20.0,),
             const Stats(),
          ],
        )
    );
  }
}


class Header extends StatelessWidget {
  const Header({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.arrow_downward,color: Colors.black,),
          SizedBox(width: 50.0,),
          Text("All Cards",style: TextStyle(fontWeight: FontWeight.w500,
              fontSize: 18,color: Colors.black54,shadows:  <Shadow>[
                Shadow(color: Colors.black54,blurRadius: 1.0,offset: Offset(1.0, 1.0))]),),
        ],
      ),
    );
  }
}


class Stats extends StatelessWidget {
  const Stats({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: ProgressCard()),
        Flexible(child: ProgressCard(),)
      ],
    );
  }
}


class ProgressCard extends StatelessWidget {
  const ProgressCard({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width/1.5,
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Your Limit", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color:Colors.black54,
            )),

            Padding(
              padding: const EdgeInsets.only(left:24.0),
              child:const CurrencyLogo(isDarkBackground: false,),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/8,
              width: MediaQuery.of(context).size.height/8,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Center(
                    child: Text("17 %", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color:Colors.black54,

                    )
                    ),
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    value: 0.4,
                    strokeWidth: 8,
                    backgroundColor: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}







