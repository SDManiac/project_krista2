import 'package:flutter/material.dart';
import 'package:project_krista2/models/cart.dart';
import 'package:project_krista2/pages/cart_p.dart';
import 'package:project_krista2/pages/item_p.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.amberAccent[700],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 + 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) => Hero(
                      tag: cartItems.values.toList()[index].imgURL,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ItemPage(
                                  beerId: cartItems.keys.toList()[index])));
                        },
                        // Контейнер с кол-вом товара
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: 35,
                              height: 35,
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 3.0,
                                        spreadRadius: 3.0,
                                        offset: Offset(-2, 2))
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(cartItems.values
                                        .toList()[index]
                                        .imgURL),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            // Расположение иконки с кол-вом
                            Positioned(
                                right: 2,
                                bottom: 5,
                                child: Container(
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.black,
                                  ),
                                  constraints: BoxConstraints(
                                      minWidth: 16, maxHeight: 16),
                                  child: Text(
                                    '(${cartItems.values.toList()[index].quantity}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ))),
            ),

            // Иконка корзины с общей суммой
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(cartData.totalAmount.toStringAsFixed(2)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ));
                      },
                      icon: Icon(Icons.shopping_bag, color: Color(0xFFd4931a)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
