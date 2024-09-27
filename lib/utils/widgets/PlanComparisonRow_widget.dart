import 'package:flutter/material.dart';


class PlanComparisonRow extends StatelessWidget {
  final String feature;
  final String free;
  final String silver;
  final String gold;

  PlanComparisonRow(this.feature, this.free, this.silver, this.gold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 190,
            child: Text(
              feature,
              style: TextStyle(fontSize: 13),
            ),
          ),
          _buildFeatureIcon(free),
          SizedBox(width: 20),
          _buildFeatureIcon(silver),
          SizedBox(width: 20),
          _buildFeatureIcon(gold),
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(String value) {
    if (value == "✓") {
      return Icon(Icons.check, color: Colors.green);
    } else if (value == "✗") {
      return Icon(Icons.close, color: Colors.red);
    } else {
      return Text(value);
    }
  }
}