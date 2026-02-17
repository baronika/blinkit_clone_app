import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Grids.dart';

class BeautyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BeautyScreenState();

}

class _BeautyScreenState extends State<BeautyScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Grids()
    );
  }
}