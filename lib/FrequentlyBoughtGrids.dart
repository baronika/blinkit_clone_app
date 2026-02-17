import 'package:blinkit_clone_app/ShowBottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrequentlyBoughtGrids extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _FrequentlyBoughtGrids();
  }

class _FrequentlyBoughtGrids extends State<FrequentlyBoughtGrids> {
  final List<Map<String, String>> items = [
    {
      "image": "assets/icons/67419100_9662747.png",
      "image2": "vecteezy_computer-monitor-png_9887131.png",
      "text": "Home"
    },
    {
      "image": "assets/icons/67419100_9662747.png",
      "image2": "vecteezy_computer-monitor-png_9887131.png",
      "text": "Home"
    },
    {
      "image": "assets/icons/67419100_9662747.png",
      "image2": "vecteezy_computer-monitor-png_9887131.png",
      "text": "Home"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.9
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              ShowBottomSheet.show(context);
            },
              child: Card(
                color: Color(0xFFE2EEF1),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(4, 10, 4, 20),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            items[index]["image"]!,
                          ),
                        ),
                        SizedBox(width: 5,),

                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            items[index]["image"]!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    height: 20,
                    width: 70,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text("+1 more"),
                ),
                SizedBox(height: 10,),
                Text(
                  items[index]["text"]!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
              ),
              ),
          );
        }
    );
  }
}