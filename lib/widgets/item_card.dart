import 'package:flutter/material.dart';
import 'package:project_krista2/models/beer.dart';
import 'package:project_krista2/models/cart.dart';
import 'package:project_krista2/pages/item_p.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beer = Provider.of<Beer>(context, listen: false);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(beer.color)).withOpacity(0.83),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemPage(
                        beerId: beer.id,
                      )));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(beer.imgURL),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  child: Text('${beer.title}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${beer.price}'),
              IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Colors.black45),
                  onPressed: () {
                    Provider.of<CartDataProvider>(context, listen: false)
                        .addItem(
                            beerId: beer.id,
                            price: beer.price,
                            title: beer.title,
                            imgURL: beer.imgURL);
                  })
            ],
          )),
        ],
      ),
    );
  }
}
