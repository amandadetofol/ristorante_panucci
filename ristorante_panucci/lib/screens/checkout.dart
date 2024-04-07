import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/order_item.dart';
import 'package:panucci_ristorante/components/payment_method.dart';
import 'package:panucci_ristorante/components/payment_total.dart';

import '../cardapio.dart';
import '../components/main_drawer.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  final List orders = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ristorante Panucci"),
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                Icons.account_circle,
                size: 32,
              ),
            )
          ],
          centerTitle: true,
        ),
        drawer: const MainDrawer(),
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Pedido",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return OrderItem(
                      imageURI: orders[index]["image"],
                      itemTitle: orders[index]["name"],
                      itemPrice: orders[index]["price"]);
                }, childCount: orders.length)),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 24),
                    child: Text(
                      "Pagamento",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: PaymentMethod(),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 24),
                    child: Text(
                      "Confirmar",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: PaymentTotal(),
                )
              ],
            )));
  }
}
