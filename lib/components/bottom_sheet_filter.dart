import 'package:blinkit_clone_app/components/SearchBar2.dart';
import 'package:blinkit_clone_app/components/ShowBottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetFilter {
  // final String type;
  // final String properties;
  // final String price;

  // BottomSheetFilter(this.type, this.properties, this.price);
  static void show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),),
        builder: (context) {
          return const _BottomSheetFilterState();
        });
  }
}

class _BottomSheetFilterState extends StatelessWidget {


  const _BottomSheetFilterState();


  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filterMenu = [
      // {"type": type},
      // {"price": price},
      // {"properties": properties}
    ];
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 400,
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Filters",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                Flexible(
                    child: SearchBar2()
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                Container(
                child: ListView.builder(
                itemCount: filterMenu.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            child: Column(children: [
                              Text(filterMenu[index]["text"]!),
                            ],
                            ),
                          )
                        ],
                      ),);
                  }
                ))
                  //type list  price below 99() above 100() checkbox
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF649A4E),),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Text("Clear Filter",
                              style: TextStyle(
                                  color: Color(0xFF649A4E),
                                  fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF649A4E),
                            ),
                            child: Text("Clear Filter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}