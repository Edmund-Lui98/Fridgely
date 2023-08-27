import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<bool> _checkBoxValues = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _checkBoxValues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            subtitle: Row(
              children: [
                Expanded(child: Text("Expiry")),
                Expanded(child: Text("Expiry"))
              ],
            ),
            trailing: Checkbox(
              value: _checkBoxValues[index],
              onChanged: (newValue) {
                setState(() {
                  _checkBoxValues[index] = newValue!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
