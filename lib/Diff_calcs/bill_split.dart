// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class BillSplitterPage extends StatefulWidget {
  const BillSplitterPage({super.key});

  @override
  _BillSplitterPageState createState() => _BillSplitterPageState();
}

class _BillSplitterPageState extends State<BillSplitterPage> {
  List<Friend> friends = [];
  List<String> commonItems = [];
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

  void addCommonItem() {
    setState(() {
      commonItems.add('');
    });
  }

  void removeCommonItem(int index) {
    setState(() {
      commonItems.removeAt(index);
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

    double commonTotal = commonItems.fold(0, (sum, item) {
      return sum + evaluateExpression(item);
    });

    double tax = totalBill * 0.05; // CGST (2.5%) + SGST (2.5%)
    double discount = totalBill * (tipPercentage / 100);
    double grandTotal = totalBill + tax - discount + commonTotal;

    for (var friend in friends) {
      double friendShare = friend.amount / totalBill;
      friend.splitAmount = friend.amount + (tax * friendShare) + (discount * friendShare) + (commonTotal / friends.length);
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
              style: ElevatedButton.styleFrom(
                maximumSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(8.0),
              ),
              onPressed: addFriend,
              child: Text("Add Friends", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(8.0),
              ),
              onPressed: addCommonItem,
              child: Text("Add Common Item", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.onTertiary,
                labelText: 'Discount (%)',
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                tipPercentage = double.tryParse(value) ?? 10;
              },
            ),
            const SizedBox(height: 10),
            ...commonItems.asMap().entries.map((entry) {
              int index = entry.key;
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.onTertiary,
                                labelText: 'Common Item (e.g., 234.54)',
                                border: const OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  commonItems[index] = value;
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => removeCommonItem(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onTertiary,
                          labelText: 'Name',
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            friend.name = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Items (e.g., 234.54+32.09)',
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onTertiary,
                          border: const OutlineInputBorder(),
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
              style: ElevatedButton.styleFrom(
                maximumSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(8.0),
              ),
              onPressed: calculateSplit,
              child: Text("Calculate Split", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
            ),
            if (showSplit) ...[
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Split Result:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      ...friends.map((friend) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              '${friend.name}: \$${friend.splitAmount.toStringAsFixed(2)} (Items: \$${friend.amount.toStringAsFixed(2)})',
                              style: Theme.of(context).textTheme.titleSmall,
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
