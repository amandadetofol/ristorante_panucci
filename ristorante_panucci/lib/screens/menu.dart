import 'package:flutter/cupertino.dart';
import 'package:panucci_ristorante/components/food_item.dart';
import '../cardapio.dart';

class Menu extends StatelessWidget {
  final List items = comidas;

  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "Menu",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontFamily: "Caveat"),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return FoodItem(
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                  imageURI: items[index]["image"]);
            }, childCount: items.length))
          ],
        ));
  }
}
