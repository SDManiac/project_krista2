import 'package:flutter/material.dart';

class BeerCatalog extends StatelessWidget {
  final String imgURL;

  BeerCatalog({Key key, this.imgURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пивной каталог'),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 1,
          children: <Widget>[
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
            _buildBeer(imgURL),
          ],
        ),
      ),
    );
  }

  Widget _buildBeer(String imgURL) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(imgURL), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Color(0xffb8926d)),
        child: Text(
          'Sample pivko',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            backgroundColor: Colors.black45,
          ),
        ),
      );
}
