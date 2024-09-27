import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class PlanOption extends StatelessWidget {
  final String planName;
  final String price;
  final bool isSelected;
  final List<Color> gradientColors;

  PlanOption({
    required this.planName,
    required this.price,
    required this.isSelected,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Row(
                children: [
                 const Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 20),
                  const SizedBox(width: 10),
                  Text(planName),
                ],
              ),
              SizedBox(height: 5),
              Text(
                price,
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          if (isSelected)
            Positioned(
              top: -20,
              right: -23,
              child: Icon(Icons.check_circle, color: Colors.blue, size: 20),
            ),
        ],
      ),
    );
  }
}
