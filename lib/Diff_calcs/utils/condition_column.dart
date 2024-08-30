import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ConditionColumn extends StatelessWidget {
  final String name;
  final double value;
  final bool isHighlighted;
  final String? modifier;
  final bool check_Condition;
  const ConditionColumn(
      {super.key, required this.isHighlighted, required this.name, required this.value, this.modifier, required this.check_Condition});

  @override
  Widget build(BuildContext context) {
    return check_Condition
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.grey[900] : Colors.black,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: isHighlighted ? Colors.white : Colors.grey[800]!,
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '${modifier ?? ''}₹${NumberFormat('#,##,##0').format(value)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
