import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
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
                  child: Text('Горизонтальный список карточек'),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Пивной каталог'),
                ),
                Container(
                  child: Text('Список каталогов'),
                ),
              ],
            )),
      ),
    );
  }
}
