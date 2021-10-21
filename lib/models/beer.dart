// ignore_for_file: file_names

import 'dart:collection';

import 'package:flutter/foundation.dart';

class Beer {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgURL;
  final color;

  Beer({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imgURL,
    @required this.color,
  });
}

class BeerDataProvider with ChangeNotifier {
  final List<Beer> _items = [
    Beer(
        id: 'b1',
        title: 'Американский лагер',
        description: 'Отвал башки (позже напишу норм)',
        price: 135,
        imgURL:
            'https://im0-tub-ru.yandex.net/i?id=eb07c40f38478e44a037275c2a5b3485-l&n=13',
        color: '0xFFFFF59D')
  ];

  UnmodifiableListView<Beer> get items => UnmodifiableListView(_items);
}
