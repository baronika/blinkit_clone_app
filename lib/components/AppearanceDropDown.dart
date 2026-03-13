import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppearanceDropDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _AppearanceDropDown();

}

class _AppearanceDropDown extends State<AppearanceDropDown>{
  String selected="Light";
  final List<String> items=[
    "Light",
    "Dark",
    "System Theme",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.white,
      value: selected,
        icon: Icon(Icons.arrow_drop_down, size: 20,),
        isDense: true,
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