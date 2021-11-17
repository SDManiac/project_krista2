import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final imgURL;

  CatalogListTile({Key key, this.imgURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // !- Переход на страницу каталога
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
              Text('09:00 – 00:00'),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent[700],
                  ),
                  Text('4.9')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
