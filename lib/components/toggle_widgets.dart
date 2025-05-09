import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  String selectedOption = "Hot";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 224, 221, 221),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            _buildToggleWidget(
              "Hot",
            ),
            SizedBox(
              width: 20,
            ),
            _buildToggleWidget(
              'Iced',
            ),
          ],
        ));
  }

  Widget _buildToggleWidget(Label) {
    bool isSelected = (selectedOption == Label);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = Label; // حدد الخيار اللي داسته
          print("Selected: $selectedOption");
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : const Color.fromARGB(255, 224, 221, 221),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(Label),
      ),
    );
  }
}
