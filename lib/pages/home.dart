import 'package:flutter/material.dart';
import 'package:project_krista2/models/beer.dart';
import 'package:project_krista2/pages/user_p.dart';
import 'package:project_krista2/widgets/bottom_bar.dart';
import 'package:project_krista2/widgets/catalog.dart';
import 'package:project_krista2/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beerData = Provider.of<BeerDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent[700],
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height - 85,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://sun9-81.userapi.com/impg/mhyQuFYcnk5F00F2B_p3715M-Z2rQ7Gil8u_Pw/KZa99flGaFU.jpg?size=2560x1707&quality=95&sign=78f330fbbd86519c828a8b8b11f56cb1&type=album'),
                    fit: BoxFit.cover)),
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: const Text(
                      'Крафтовое пиво',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Популярные сорта на любой вкус',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    // -! Надо подумать
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPage()));
                      },
                      icon: const Icon(Icons.account_circle),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: beerData.items.length,
                      itemBuilder: (context, int index) =>
                          ChangeNotifierProvider.value(
                              value: beerData.items[index], child: ItemCard())),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(right: 225),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFFFAB00).withOpacity(0.9)),
                  child: const Text(
                    'Пивные подборки',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                ...beerData.items.map((value) {
                  return CatalogListTile(imgURL: value.imgURL);
                }).toList(),
              ],
            )),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
