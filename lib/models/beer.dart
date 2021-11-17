// ignore_for_file: file_names

import 'dart:collection';

import 'package:flutter/foundation.dart';

class Beer with ChangeNotifier {
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
        description:
            'Легкотелый, сильно газированный, без выраженного вкуса. Подается холодным, хорошо освежает в жару. В букете почти не чувствуются солодовые или хмелевые нотки, допускаются легкие цветочные и травяные нюансы. Лучшее определение аромата – сладковатый, зерновой. Крепость: 4.2-5.2%. Плотность: начальная 1.040-1.050, конечная 1.004-1.010. Индекс горечи: 8-18 IBU.',
        price: 135.00,
        imgURL:
            'https://sun9-28.userapi.com/impg/kVyS9CCmeih_32NSAnAqFLsPdHOviwNQzOIFXw/zE5UCBnH234.jpg?size=761x810&quality=95&sign=c96c0de0587656614ce2007e980c4ae7&type=album',
        color: '0xFFc4af90'),
    Beer(
        id: 'b2',
        title: 'Бельгийский эль',
        description:
            'Золотой эль умеренной крепости, имеющий тонкую фруктово-пряную сложность бельгийских дрожжей, слегка солодово-сладкий вкус и сухой финиш.',
        price: 170.00,
        imgURL:
            'https://sun9-43.userapi.com/impg/2pgaN51xsmTBGhiX7MIQtl7v37es-r226DuRjA/L84hBBcnsx4.jpg?size=561x749&quality=95&sign=297661f7556c97cadfcb6c992e4345b4&type=album',
        color: '0xffce731c'),
    Beer(
        id: 'b3',
        title: 'Портер',
        description:
            'Английская классика темного пива для настоящих работяг. Отличительная особенность вкуса портера – выраженный солодовый профиль с ненавязчивыми жареными нотками, тонами шоколада, бисквита, тостов.',
        price: 150.00,
        imgURL:
            'https://sun9-30.userapi.com/impg/MIdarlHqsxNYRfbWy0WO9VRmNE5JZocdHmOROg/viRohWKX4bs.jpg?size=533x800&quality=95&sign=142cf701bdf3bf3251c2f7df677acb4e&type=album',
        color: '0xffb8926d'),
  ];

  UnmodifiableListView<Beer> get items => UnmodifiableListView(_items);

  Beer getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
