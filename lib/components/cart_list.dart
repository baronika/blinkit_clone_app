import 'package:blinkit_clone_app/components/add_button.dart';
import 'package:blinkit_clone_app/components/add_button_1.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';

class CartList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final List<Map<String, String>> itemss = [
    {"image2": "assets/icons/67419100_9662747.png", "text2": "JBL Hadphones e58", "quantity":"1 set", "price": "Rs.5000"},
    {"image2": "assets/icons/67419100_9662747.png", "text2": "JBL Hadphones e58", "quantity":"1 set", "price": "Rs.5000"},
    {"image2": "assets/icons/67419100_9662747.png", "text2": "JBL Hadphones e58", "quantity":"1 set", "price": "Rs.5000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView.builder(
        itemCount: itemss.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, AppRoutes.item_detail_screen),
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: Color(0xC0F2F2FA)
                    ),
                    child: Image.asset(itemss[index]["image2"]!),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemss[index]["text2"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Text(itemss[index]["quantity"]!,
                        style: TextStyle(
                          fontSize: 12
                        ),),
                        Text("Move to wishlist",
                        style: TextStyle(
                          fontSize:12,
                        ),),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AddButton1(),
                      SizedBox(height: 5,),
                      Text(itemss[index]["price"]!),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
