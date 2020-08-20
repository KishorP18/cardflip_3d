import 'package:cardflip_3d/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class FlipCard extends StatelessWidget {
  final Matrix4 transform;
  final int index;

  const FlipCard({Key key,@required this.index,this.transform})
      :assert(index!=null),super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      transform:transform,
      height: MediaQuery.of(context).size.height / 3.3,
      decoration: BoxDecoration(
          color: Util.cards[index].cardColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
                blurRadius: 4.0),
          ]),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                Util.cards[index].title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Util.cards[index].isDarkBackground?Colors.white70:Colors.black54,
                    shadows: Util.getShadowStyle()),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CurrencyLogo(isDarkBackground: Util.cards[index].isDarkBackground,),
              ),
              SvgPicture.asset(
                "assets/audi.svg",
                height: 50,
                width: 50,
                color: Util.cards[index].isDarkBackground?Colors.white70:Colors.black54,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),

    );
  }
}


class CurrencyLogo extends StatelessWidget {
  final String amount;
  final bool isDarkBackground;

  const CurrencyLogo({Key key, this.amount = "767",this.isDarkBackground=true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/pound_sign.svg",
            height: 20,
            width: 20,
            color: isDarkBackground?Colors.white70:Colors.black54,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(amount,   style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28,
              color:isDarkBackground?Colors.white70:Colors.black54,
              shadows: Util.getShadowStyle()),),
        ],
      ),
    );
  }
}