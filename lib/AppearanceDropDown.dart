import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppearanceDropDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _AppearanceDropDown();

}

class _AppearanceDropDown extends State<AppearanceDropDown>{
  String selected="LIGHT";
  final List<String> items=[
    "LIGHT",
    "DARK",
    "SYSTEM THEME",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selected,
        icon: Icon(Icons.arrow_drop_down),
        underline: SizedBox(),
        items: items.map((String item){
          return DropdownMenuItem(
              value: item,
              child: Text(item),
          );
        }).toList(),
        onChanged: (value){
        setState(() {
          selected=value!;
        });
        },
    );
  }
}