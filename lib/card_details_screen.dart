import 'package:cardflip_3d/clip_background.dart';
import 'package:cardflip_3d/flip_card.dart';
import 'package:cardflip_3d/util.dart';
import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  final int index;
  const CardDetailScreen({Key key, this.index = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: ClipBackground(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Util.cards[index].cardColor.withOpacity(0.9),
                        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0),bottomRight: Radius.circular(100.0)),


                    ),
                  ),
                ),
                Positioned(
                    top: 40,
                    left: 20,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Util.cards[index].isDarkBackground
                              ? Colors.white70
                              : Colors.black,
                        ),
                        onPressed: () => Navigator.pop(context))),
                Positioned(
                    top: 100,
                    left: 20,
                    child: Hero(
                        tag: Util.cards[index].heroTag,
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: FlipCard(index: index)))),
              ],
            ),

            const TabBarRow(),
            const Divider(color: Colors.black54,),
            DebitDetails(),
            const Divider(color: Colors.black54,),
            CreditDetails(),
            const Divider(color: Colors.black54,),

          ],
        ),
      ),
    );
  }
}


class TabBarRow extends StatelessWidget {
  const TabBarRow({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 30.0,
        child: ListView(
          primary: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Chip(
              padding: const EdgeInsets.all(8.0),
              label: Text("All",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
            SizedBox(width: 10.0,),
            Chip(
              padding: const EdgeInsets.all(8.0),
              label: Text("Debit"),backgroundColor: Colors.black12,),
            SizedBox(width: 10.0,),
            Chip(
              padding: const EdgeInsets.all(8.0),
              label: Text("Credit"),backgroundColor: Colors.black12,),

            SizedBox(width: 10.0,),
            Chip(
              padding: const EdgeInsets.all(8.0),
              label: Text("Other"),backgroundColor: Colors.black12,),

          ],
        ),
      ),
    );
  }
}


class DebitDetails extends StatelessWidget {
  const DebitDetails({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 8.0,bottom: 8.0),
      child: Container(
        child: ListTile(
          title: Text("Spent at Kayak",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text("18th August,2020",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400),),
          ),
          trailing: Text("- 277",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16.0),),
        ),
      ),
    );
  }
}


class CreditDetails extends StatelessWidget {
  const CreditDetails({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 8.0,bottom: 8.0),
      child: Container(
        child: ListTile(
          title: Text("Cashback Received",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text("19th August,2020",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400),),
          ),
          trailing: Text("+ 300",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 16.0),),
        ),
      ),
    );
  }
}

