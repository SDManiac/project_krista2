import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_krista2/models/beer.dart';
import 'package:project_krista2/models/cart.dart';
import 'package:project_krista2/pages/cart_p.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String beerId;

  ItemPage({Key key, this.beerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<BeerDataProvider>(context).getElementById(beerId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://sun9-81.userapi.com/impg/mhyQuFYcnk5F00F2B_p3715M-Z2rQ7Gil8u_Pw/KZa99flGaFU.jpg?size=2560x1707&quality=95&sign=78f330fbbd86519c828a8b8b11f56cb1&type=album'),
                fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Hero(
              tag: data.imgURL,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54, width: 3),
                    image: DecorationImage(
                        image: NetworkImage(data.imgURL), fit: BoxFit.cover)),
              ),
            ),
            Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(fontSize: 26.0),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Цена: ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text(
                          '${data.price}',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(data.description),

                    SizedBox(
                      height: 20.0,
                    ),

                    // Есть ли уже в корзине это пиво
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(beerId)
                        ? Column(
                            children: <Widget>[
                              MaterialButton(
                                  color: Color(0xFFCCFF90),
                                  child: Text('Перейти в корзину'),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => CartPage()));
                                  }),
                              Text(
                                'Пиво уже в корзине',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.blueGrey,
                                ),
                              )
                            ],
                          )
                        : MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('Добавить пиво в корзину'),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                beerId: data.id,
                                imgURL: data.imgURL,
                                title: data.title,
                                price: data.price,
                              );
                            },
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
