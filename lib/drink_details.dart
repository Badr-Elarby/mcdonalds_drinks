import 'package:flutter/material.dart';
import 'package:mcdonalds_drinks/components/quantity_widgets.dart';
import 'package:mcdonalds_drinks/components/toggle_widgets.dart';
import 'package:mcdonalds_drinks/model.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
      });
    });
    super.initState();
  }

  ///logic
  int selectedIndex = 0;

//access model easily
  final drinks = DrinkModel.drinks;

  List<IconData> DrinksIcons = [
    Icons.local_drink, // Small
    Icons.local_drink, // Medium
    Icons.local_drink, // Large
    Icons.arrow_forward, // More
  ];
  List<double> iconSizes = [20.0, 25.0, 30.0, 20.0];

  List<Text> TextsOfButtons = [
    const Text(
      'Small',
      style: TextStyle(fontSize: 14),
    ),
    const Text(
      'Medium',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'Large',
      style: TextStyle(fontSize: 18),
    ),
    const Text(
      'More',
      style: TextStyle(fontSize: 14),
    ),
  ];

  List<SizedBox> sizedBoxes = [
    const SizedBox(
      height: 9,
    ),
    const SizedBox(
      height: 4,
    ),
    const SizedBox(
      height: 0,
    ),
    const SizedBox(
      height: 9,
    ),
  ];
  // Small, Medium, Large, More
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Stack(children: [
            //widget 1
            Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drinks[_currentPage.round()].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 17),
                        ),
                        Text(drinks[_currentPage.round()].title),
                      ],
                    ),
                    Text(
                      '${drinks[_currentPage.round()].price}€',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                )),

            //widget 2
            PageView.builder(
              controller: _controller,
              itemCount: drinks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final scale = 1 - (_currentPage - index).abs() * 1;
                final translateY = (_currentPage - index).abs() * 400;

                return Transform.translate(
                  offset: Offset(translateY, 0),
                  child: Transform.scale(
                    scale: scale.clamp(0.5, 1.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              drinks[index].image,
                              height: 600,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                                left: 0,
                                bottom: 90,
                                right: 0,
                                child: Container(
                                    width: 0,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 30,
                                            spreadRadius: 10,
                                          )
                                        ])))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),

            //widget 3 multi selection
            Positioned(
              left: 0,
              right: 0,
              bottom: 140,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                                color: selectedIndex == index
                                    ? Colors.orange
                                    : Colors.white,
                              ),
                              child: Icon(DrinksIcons[index],
                                  size: iconSizes[index],
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                            sizedBoxes[index],
                            TextsOfButtons[index],
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, // بدل top: 750، هنستخدم left وright مع bottom
              right: 0,
              bottom: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleWidget(),
                    SizedBox(
                      width: 60,
                    ),
                    Expanded(child: QuantityWidget()),
                  ],
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
