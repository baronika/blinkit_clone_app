import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Grids.dart';

class ElectronicsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _ElectronicScreenState();

}

class _ElectronicScreenState extends State<ElectronicsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Grids()
    );
  }
}