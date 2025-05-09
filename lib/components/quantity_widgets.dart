import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (number > 1) {
                    number--;
                  } else {
                    return;
                  }
                });
              },
              child: Text(
                "-",
                style: TextStyle(fontSize: 32),
              ),
            ),
            Text(
              number.toString(),
              style: TextStyle(fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  number++;
                });
              },
              child: Text(
                "+",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
