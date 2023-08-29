import 'package:flutter/material.dart';
import 'package:fridge_expiry/Components/FridgeList.dart';

class Searchbar extends StatefulWidget {
  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _searchController = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            )),
        Expanded(
          child: FridgeList(search: search),
        )
      ],
    );
  }
}
