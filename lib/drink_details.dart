import 'package:flutter/material.dart';
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

  final drinks = DrinkModel.drinks;

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
                          height: 100,
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              drinks[index].image,
                              height: 600,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                                top: 450,
                                left: 0,
                                bottom: 50,
                                right: 0,
                                child: Container(
                                    width: 0,
                                    height: 0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 80,
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

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 100,
              child: Row(
                children: List.generate(
                  4,
                  (index) {
                    return CircleAvatar(
                      child: Icon(Icons.star),
                    );
                  },
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
