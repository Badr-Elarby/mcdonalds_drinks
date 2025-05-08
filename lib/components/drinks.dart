import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  const Drink(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.title});
  final String name;
  final String price;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 60,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -0,
            left: 20,
            bottom: 50,
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                blurRadius: 20,
                                spreadRadius: 2,
                              )
                            ])),
                    Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            )),
        Positioned(
            top: 60,
            left: 150,
            bottom: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )),
        Positioned(
            top: 130,
            left: 270,
            bottom: 60,
            right: 0,
            child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black26),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                )))
      ],
    );
  }
}
