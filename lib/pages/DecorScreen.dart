import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Grids.dart';

class DecorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_DecorScreenState();

}

class _DecorScreenState extends State<DecorScreen>{
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