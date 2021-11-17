import 'package:flutter/material.dart';
import 'package:project_krista2/models/beer.dart';
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                )),
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                Container(
                  child: const ListTile(
                    title: Text(
                      'Крафтовое пиво',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Наиболее популярные сорта на любой вкус',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Icon(Icons.panorama_horizontal),
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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Пивной каталог'),
                ),
                ...beerData.items.map((value) {
                  return CatalogListTile(imgURL: value.imgURL);
                }).toList(),
              ],
            )),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
