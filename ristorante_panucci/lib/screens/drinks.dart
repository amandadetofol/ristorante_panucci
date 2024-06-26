import 'package:flutter/cupertino.dart';
import 'package:panucci_ristorante/components/drink_item.dart';
import '../cardapio.dart';

class Drinks extends StatelessWidget {
  const Drinks({super.key});
  final List listdrinks = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Drinks",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontFamily: "Caveat"),
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return DrinkItem(
                      imageURI: listdrinks[index]["image"],
                      itemTitle: listdrinks[index]["name"],
                      itemPrice: listdrinks[index]["price"]);
                }, childCount: listdrinks.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape ? 220 / 194 : 158 / 194,
              ),)
          ],
        ));
  }
}

