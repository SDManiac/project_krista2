import 'package:flutter/material.dart';
import 'package:project_krista2/pages/catalog_p.dart';

class CatalogListTile extends StatelessWidget {
  final imgURL;

  CatalogListTile({Key key, this.imgURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BeerCatalog(imgURL: imgURL)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF).withOpacity(0.9),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 20),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imgURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('Выбор постоянных клиентов'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('За что ценители голосуют рублем'),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text('5.0')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
