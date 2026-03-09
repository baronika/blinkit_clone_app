import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Grids.dart';

class BeautyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BeautyScreenState();

}

class _BeautyScreenState extends State<BeautyScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Grids(),
        )
    );
  }
}