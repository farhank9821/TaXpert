import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class BillSplitterPage extends StatefulWidget {
  const BillSplitterPage({super.key});

  @override
  _BillSplitterPageState createState() => _BillSplitterPageState();
}

class _BillSplitterPageState extends State<BillSplitterPage> {
  List<Friend> friends = [];
  double tipPercentage = 10;
  bool showSplit = false;

  void addFriend() {
    setState(() {
      friends.add(Friend(name: 'Friend ${friends.length + 1}'));
    });
  }

  void removeFriend(int index) {
    setState(() {
      friends.removeAt(index);
    });
  }

  double evaluateExpression(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      return 0;
    }
  }

  void calculateSplit() {
    double totalBill = 0;
    for (var friend in friends) {
      friend.amount = evaluateExpression(friend.expression);
      totalBill += friend.amount;
    }

    double tax = totalBill * 0.05; // CGST (2.5%) + SGST (2.5%)
    double tip = totalBill * (tipPercentage / 100);
    double grandTotal = totalBill + tax + tip;

    for (var friend in friends) {
      double friendShare = friend.amount / totalBill;
      friend.splitAmount = friend.amount + (tax * friendShare) + (tip * friendShare);
    }

    setState(() {
      showSplit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Splitter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: addFriend,
              child: const Text('Add Friend'),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Tip Percentage'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tipPercentage = double.tryParse(value) ?? 10;
              },
            ),
            const SizedBox(height: 16),
            ...friends.asMap().entries.map((entry) {
              int index = entry.key;
              Friend friend = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Friend ${index + 1} Name'),
                        onChanged: (value) {
                          setState(() {
                            friend.name = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(labelText: 'Items (e.g., 234.54+32.09)'),
                        onChanged: (value) {
                          setState(() {
                            friend.expression = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeFriend(index),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateSplit,
              child: const Text('Calculate Split'),
            ),
            if (showSplit) ...[
              const SizedBox(height: 16),
              const Text('Split Result:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...friends
                  .map((friend) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text('${friend.name}: \$${friend.splitAmount.toStringAsFixed(2)} (Items: \$${friend.amount.toStringAsFixed(2)})'),
                      ))
                  .toList(),
              TextButton(
                onPressed: () {
                  setState(() {
                    showSplit = false;
                  });
                },
                child: const Text('Close Split'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Friend {
  String name;
  String expression;
  double amount;
  double splitAmount;

  Friend({required this.name, this.expression = '', this.amount = 0, this.splitAmount = 0});
}
