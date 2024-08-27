import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart'; // Add this package to evaluate expressions

class BillSplitterPage extends StatefulWidget {
  const BillSplitterPage({super.key});

  @override
  _BillSplitterPageState createState() => _BillSplitterPageState();
}

class _BillSplitterPageState extends State<BillSplitterPage> {
  List<Friend> friends = [];
  double commonAmount = 0;
  double tipPercentage = 10;
  bool showSplit = false;

  void addFriend() async {
    String? friendName = await _showAddFriendDialog();
    if (friendName != null && friendName.isNotEmpty) {
      setState(() {
        friends.add(Friend(name: friendName));
      });
    }
  }

  Future<String?> _showAddFriendDialog() async {
    final TextEditingController nameController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Friend\'s Name'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(nameController.text);
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void removeFriend(int index) {
    setState(() {
      friends.removeAt(index);
    });
  }

  void calculateSplit() {
    double totalBill = commonAmount;
    for (var friend in friends) {
      totalBill += friend.amount;
    }

    double tax = totalBill * 0.05; // CGST (2.5%) + SGST (2.5%)
    double tip = totalBill * (tipPercentage / 100);
    double grandTotal = totalBill + tax + tip;

    double splitAmount = (grandTotal + commonAmount) / friends.length;

    for (var friend in friends) {
      friend.splitAmount = splitAmount;
    }

    setState(() {
      showSplit = true;
    });
  }

  void _handleAmountChange(String value, Friend friend) {
    try {
      // Remove all spaces
      String cleanedValue = value.replaceAll(' ', '');

      // Use regular expression to check for basic arithmetic
      RegExp exp = RegExp(r'^[0-9+\-*/().]+$');
      if (exp.hasMatch(cleanedValue)) {
        final expression = Expression.parse(cleanedValue);
        const evaluator = ExpressionEvaluator();
        final result = evaluator.eval(expression, {});
        friend.amount = result;
      } else {
        friend.amount = double.tryParse(cleanedValue) ?? 0;
      }
    } catch (e) {
      friend.amount = 0;
    }

    setState(() {});
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
              decoration: const InputDecoration(labelText: 'Common Amount (e.g., water bottle)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                commonAmount = double.tryParse(value) ?? 0;
              },
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: friend.name),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _handleAmountChange(value, friend);
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
                        child: Text('${friend.name}: \$${friend.splitAmount.toStringAsFixed(2)}'),
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
  double amount;
  double splitAmount;

  Friend({required this.name, this.amount = 0, this.splitAmount = 0});
}
