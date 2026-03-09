import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  final String name;
  final Icon image;

  Item({
        required this.name,
        required this.image}
      );
}

List<Item> searchedItems=[
  Item(name: "Apple", image: Icon(Icons.apple),),
    Item(name: "Apple", image: Icon(Icons.apple),),
    Item(name: "Apple", image: Icon(Icons.apple),)
];