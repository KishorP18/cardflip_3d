import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util{
 static  List<Shadow> getShadowStyle(){
    return <Shadow>[Shadow(color: Colors.black54,blurRadius: 6.0,offset: Offset(1.0, 1.0))];
  }



 static List<FlipCardModel> cards=[
   FlipCardModel(cardColor: Colors.grey,index: 0,isDarkBackground: false,title: "VOUCHER",heroTag: "0"),
   FlipCardModel(cardColor: Colors.deepPurpleAccent,index: 1,isDarkBackground: true,title: "CREDIT CARD",heroTag: "1"),
   FlipCardModel(cardColor: Colors.amberAccent,index: 2,isDarkBackground: false,title: "DEBIT CARD",heroTag: "2"),
   FlipCardModel(cardColor: Colors.black54,index: 3,isDarkBackground: true,title: "GIFT CARD",heroTag: "3"),

 ];
}



class FlipCardModel{
  final int index;
  final Color cardColor;
  final bool isDarkBackground;
  final String title;
  final String amount;
  final String heroTag;

  FlipCardModel({@required this.index,this.cardColor=Colors.deepPurpleAccent,this.isDarkBackground=true,this.title="GIFT CARD",
  this.amount="767",@required this.heroTag}):assert(index!=null&&heroTag!=null);

}