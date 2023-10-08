import 'package:flutter/material.dart';

class Total extends StatelessWidget {
  final double currentTotal;
  Total({required this.currentTotal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('total',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14)),
        Text(currentTotal.toStringAsFixed(2) + ' \$',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
