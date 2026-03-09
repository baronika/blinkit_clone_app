import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _ToggleButtonState();

}

class _ToggleButtonState extends State<ToggleButton>{
  @override
  Widget build(BuildContext context) {
    bool isOn=false;
    return CupertinoSwitch(
        value: isOn,
        activeColor: Colors.green,
        onChanged: (value){
          setState(() {
            isOn=value;
          });
        });
  }

}