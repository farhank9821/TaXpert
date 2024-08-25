import 'package:flutter/material.dart';

class TextWithdivider extends StatefulWidget {
  final String label;
  final String value;
  final String income;
  final bool showDivider;
  final bool showIncome; // New field to enable/disable Divider

  const TextWithdivider({
    super.key, // Don't forget to include the key parameter
    required this.label,
    required this.value,
    required this.income,
    this.showDivider = true,
    this.showIncome = false,
  });

  @override
  State<TextWithdivider> createState() => _TextWithdividerState();
}

class _TextWithdividerState extends State<TextWithdivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 5, 4, 3),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 36, 36, 36))),
                  Container(height: 2),
                  Text(
                    widget.value,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const Spacer(),
              if (widget.showIncome) // Conditionally display the Divider
                Text(
                  widget.income,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              )
            ],
          ),
          if (widget.showDivider) // Conditionally display the Divider
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 135, 134, 134),
            ),
        ],
      ),
    );
  }
}
