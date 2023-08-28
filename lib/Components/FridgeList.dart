import 'package:flutter/material.dart';

class FridgeList extends StatefulWidget {
  const FridgeList({super.key});

  @override
  State<FridgeList> createState() => _FridgeListState();
}

class _FridgeListState extends State<FridgeList> {
  List<bool> _checkBoxValues = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.03, screenHeight * 0.015,
            screenWidth * 0.03, screenHeight * 0.015),
        child: ListView.builder(
          itemCount: _checkBoxValues.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(
                    0, screenHeight * 0.015, 0, screenHeight * 0.015),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
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
                    )));
          },
        ),
      ),
    );
  }
}
