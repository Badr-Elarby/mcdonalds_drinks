import 'package:flutter/material.dart';
import 'package:mcdonalds_drinks/components/drinks.dart';
import 'package:mcdonalds_drinks/drink_details.dart';
import 'package:mcdonalds_drinks/model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: DrinkModel.drinks.length,
                itemBuilder: (context, index) {
                  final drink = DrinkModel.drinks[index];

                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double offset = 0;
                      if (controller.hasClients) {
                        offset = controller.offset / 100 - index;
                      }

                      offset = offset.clamp(0, 2);

                      return Transform.scale(
                        scale: 1 - (offset * 0.15),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const DrinkDetails())),
                          child: Drink(
                            name: drink.name,
                            price: drink.price,
                            image: drink.image,
                            title: drink.title,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
