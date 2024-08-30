import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class BillSplitterPage extends StatefulWidget {
  const BillSplitterPage({Key? key}) : super(key: key);

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
    double totalBill = friends.fold(0, (sum, friend) {
      friend.amount = evaluateExpression(friend.expression);
      return sum + friend.amount;
    });

    double tax = totalBill * 0.05; // CGST (2.5%) + SGST (2.5%)
    double discount = totalBill * (tipPercentage / 100);
    double grandTotal = totalBill + tax - discount;

    for (var friend in friends) {
      double friendShare = friend.amount / totalBill;
      friend.splitAmount = friend.amount + (tax * friendShare) + (discount * friendShare);
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
              decoration: const InputDecoration(
                labelText: 'Tip Percentage',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tipPercentage = double.tryParse(value) ?? 10;
              },
            ),
            const SizedBox(height: 16),
            ...friends.asMap().entries.map((entry) {
              int index = entry.key;
              Friend friend = entry.value;
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Friend ${index + 1}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => removeFriend(index),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            friend.name = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Items (e.g., 234.54+32.09)',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            friend.expression = value;
                          });
                        },
                      ),
                    ],
                  ),
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Split Result:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ...friends.map((friend) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              '${friend.name}: \$${friend.splitAmount.toStringAsFixed(2)} (Items: \$${friend.amount.toStringAsFixed(2)})',
                            ),
                          )),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showSplit = false;
                          });
                        },
                        child: const Text('Close Split'),
                      ),
                    ],
                  ),
                ),
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
