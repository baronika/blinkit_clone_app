import 'package:blinkit_clone_app/components/ShowBottomSheet.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/services/api/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrequentlyBoughtGrids extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _FrequentlyBoughtGrids();
  }

class _FrequentlyBoughtGrids extends State<FrequentlyBoughtGrids> {
  List<Product> frequentlyBought=[];

  @override
  void initState() {
    super.initState();
    loadFrequentlyBought();
  }

  void loadFrequentlyBought() async{
    ProductService service=ProductService();
    frequentlyBought=await service.fetchProducts();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: frequentlyBought.take(3).length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 3,
            childAspectRatio: 0.9
        ),
        itemBuilder: (context, index) {
          Product bought=frequentlyBought.take(3).toList()[index];
          return GestureDetector(
            onTap: (){
              ShowBottomSheet.show(context);
            },
              child: Card(
                elevation: 0,
                color: Color(0xFFE2EEF1),
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
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(bought.thumbnail)
                        ),
                        SizedBox(width: 5,),

                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: Image.network(bought.thumbnail)
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
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    bought.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,overflow: TextOverflow.ellipsis),
                  ),
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