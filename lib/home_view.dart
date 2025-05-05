import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
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
                      Image.asset(
                        'assets/drinks/Chocolate.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
